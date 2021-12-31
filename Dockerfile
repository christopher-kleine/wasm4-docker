ARG WASI_VERSION=14

# --- Step 1: Download and compile required packages and repositories ---
FROM docker.io/archlinux:latest AS compiler

WORKDIR /setup

ARG WASI_VERSION
ENV WASI_VERSION=$WASI_VERSION
ENV WASI_VERSION_FULL=${WASI_VERSION}.0

RUN pacman -Syu --noconfirm git curl go base-devel git gcc gdb llvm11 clang && \
    curl -L https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/wasi-sdk-${WASI_VERSION_FULL}-linux.tar.gz --output wasi-sdk.tar.gz && \
    tar xvf wasi-sdk.tar.gz && \
    # Go
    curl -L https://github.com/tinygo-org/tinygo/releases/download/v0.21.0/tinygo0.21.0.linux-amd64.tar.gz --output tinygo.tar.gz && \
    tar xvf tinygo.tar.gz && \
    # Odin
    git clone https://github.com/odin-lang/Odin && \
    cd Odin && \
    make && \
    cd /setup && \
    # Nelua
    git clone https://github.com/edubart/nelua-lang.git && \
    cd nelua-lang && \
    make


# --- Step 2: Prepare file bundles ---
FROM scratch AS bundle

ARG WASI_VERSION
ENV WASI_VERSION=$WASI_VERSION
ENV WASI_VERSION_FULL=${WASI_VERSION}.0
ENV WASI_SDK_PATH=/opt/wasi-sdk

    # Setup C/C++
COPY --from=compiler /setup/wasi-sdk-${WASI_VERSION_FULL} /opt/wasi-sdk

    # Install Go
COPY --from=compiler /setup/tinygo /opt/tinygo

    # Install Nelua
COPY --from=compiler /setup/nelua-lang/nelua /opt/nelua/nelua
COPY --from=compiler /setup/nelua-lang/nelua-lua /opt/nelua/nelua-lua
COPY --from=compiler /setup/nelua-lang/lib /opt/nelua/lib
COPY --from=compiler /setup/nelua-lang/lualib /opt/nelua/lualib

    # Install Odin
COPY --from=compiler /setup/Odin/odin /opt/odin/odin
COPY --from=compiler /setup/Odin/core /opt/odin/core
COPY --from=compiler /setup/Odin/shared /opt/odin/shared

# Step 3: Install and configure compilers
FROM docker.io/archlinux:latest

WORKDIR /wasm4

ARG WASI_VERSION
ENV WASI_VERSION=$WASI_VERSION
ENV WASI_VERSION_FULL=${WASI_VERSION}.0
ENV WASI_SDK_PATH=/opt/wasi-sdk

RUN pacman -Syu --noconfirm \
    make which \
    # AssemblyScript
    npm \
    # D
    ldc dub lld \
    # Go
    go \
    # Nim
    nim nimble \
    # Odin
    llvm11 \
    # Rust
    rustup \
    # Zig
    zig \
    && \
    # Setup WASM-4, AssemblyScript and wasm-opt
    npm install --global wasm4 assemblyscript binaryen \
    && \
    # Setup Rust
    rustup update stable && rustup target add wasm32-unknown-unknown

COPY --from=bundle /opt /opt
ENV PATH="/opt/tinygo:/opt/nelua:/opt/odin:${PATH}"

ENTRYPOINT [ "w4" ]
CMD [ "watch" ]

EXPOSE 4444