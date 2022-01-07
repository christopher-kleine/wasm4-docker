FROM docker.io/anihex/wasm4:2.1.0-c

RUN pacman -Syu --noconfirm nim nimble
