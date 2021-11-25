# Go
FROM tinygo/tinygo:0.21.0

# WASM-4 and AssemblyScript 
RUN apt install curl make npm -y
RUN npm install --global wasm4 assemblyscript binaryen

# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN /root/.cargo/bin/rustup default stable
RUN /root/.cargo/bin/rustup target add wasm32-unknown-unknown

# C, Zig, Odin, D
RUN curl -L https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-14/wasi-sdk_14.0_amd64.deb > wasi.deb
RUN dpkg -i wasi.deb
ENV WASI_SDK_PATH=/opt/wasi-sdk

# Zig
RUN curl -L https://ziglang.org/builds/zig-linux-x86_64-0.9.0-dev.1737+c42763f8c.tar.xz > zig.tar.xz
RUN tar -xvf zig.tar.xz
RUN mv -r zig-linux-x86_64-0.9.0-dev.1737+c42763f8c/* /usr/bin

# D
#RUN curl -L https://github.com/ldc-developers/ldc/releases/download/v1.28.0/ldc2-1.28.0-linux-x86_64.tar.xz > ldc.tar.xz
#RUN curl -L https://s3.us-west-2.amazonaws.com/downloads.dlang.org/releases/2021/dmd_2.098.0-0_amd64.deb > dlang.deb
#RUN tar -xvf ldc.tar.xz
#RUN cp -r ldc2-1.28.0-linux-x86_64/* /
#RUN dpkg -i dlang.deb

# Odin

WORKDIR /cart

CMD ["w4", "watch", "--no-browser"]

EXPOSE 4444
