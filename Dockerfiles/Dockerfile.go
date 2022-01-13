FROM docker.io/archlinux:latest AS downloader

WORKDIR /setup

RUN pacman -Syu --noconfirm curl

RUN curl -L https://github.com/tinygo-org/tinygo/releases/download/v0.21.0/tinygo0.21.0.linux-amd64.tar.gz --output tinygo.tar.gz && \
    tar -xf tinygo.tar.gz



FROM docker.io/anihex/wasm4:base

RUN pacman -Syu --noconfirm go

COPY --from=downloader /setup/tinygo /opt/tinygo

ENV PATH="/opt/tinygo/bin:${PATH}"
