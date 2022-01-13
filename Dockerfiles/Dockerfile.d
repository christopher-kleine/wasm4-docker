FROM docker.io/anihex/wasm4:c

RUN pacman -Syu --noconfirm ldc dub lld