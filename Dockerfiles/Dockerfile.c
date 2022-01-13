ARG WASI_VERSION=14

FROM docker.io/anihex/wasm4:base AS downloader

WORKDIR /setup

ARG WASI_VERSION
ENV WASI_VERSION=$WASI_VERSION
ENV WASI_VERSION_FULL=${WASI_VERSION}.0

RUN pacman -Syu --noconfirm curl

RUN curl -L https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/wasi-sdk-${WASI_VERSION_FULL}-linux.tar.gz --output wasi-sdk.tar.gz && \
    tar -xf wasi-sdk.tar.gz



FROM docker.io/anihex/wasm4:base AS final

WORKDIR /cart

ARG WASI_VERSION
ENV WASI_VERSION=$WASI_VERSION
ENV WASI_VERSION_FULL=${WASI_VERSION}.0
ENV WASI_SDK_PATH=/opt/wasi-sdk

COPY --from=downloader /setup/wasi-sdk-${WASI_VERSION_FULL} /opt/wasi-sdk
