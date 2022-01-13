FROM docker.io/archlinux:latest AS downloader

WORKDIR /setup

RUN pacman -Syu --noconfirm unzip

RUN curl -L https://github.com/odin-lang/Odin/releases/download/dev-2021-12/odin-ubuntu-amd64-dev-2021-12.zip --output odin.zip && \
    unzip odin.zip && \
    mv ubuntu_artifacts odin && \
    chmod +x odin/odin



FROM docker.io/anihex/wasm4:c

COPY --from=downloader /setup/odin/odin /opt/odin/odin
COPY --from=downloader /setup/odin/core /opt/odin/core
COPY --from=downloader /setup/odin/shared /opt/odin/shared

RUN pacman -Syu --noconfirm llvm11 lld \
    && \
    ln -s /usr/lib/libLLVM-11.so /usr/lib/libLLVM-11.so.1

ENV PATH="/opt/odin:${PATH}"
