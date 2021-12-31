# wasm4-docker

Dockerfile to create a docker image than compiles AssemblyScript, C, Go, Rust and Zig

Build by running `docker build --rm -t wasm4 .`

Due to the size of the resulting image, it's not recommended to use this on PCs with little space.

## Usage

### Creating a project

This image comes with wasm4 in version 2.1.0. Therefore the following languages are currently supported:

- AssemblyScript (`--as or --assemblyscript`)
- C (`--c`)
- D (`--d`)
- Go (`--go`)
- Nelua (`--nelua`)
- Nim (`--nim`)
- Odin (`--odin`)
- Rust (`--rs or --rust`)
- WebAssembly Text (`--wat`)
- Zig (`--zig`)

The command to initialize a project is `w4 init <LANGUAGE>`

```shell
docker run --rm -v $PWD:/cart wasm4 init --c
```

To create a new subfolder, use `w4 new <LANGUAGE>` instead of `w4 init <LANGUAGE>`

### Watching a project

```shell
docker run --rm -v $PWD:/cart -p 4444:4444 wasm4
```

## TODO

- [X] Install AssemblyScript
- [X] Install C
- [X] Install D
- [X] Install Go and TinyGo
- [X] Install Nelua
- [X] Install Nim
- [X] Install Odin
- [X] Install Rust
- [ ] Install WABT
- [X] Install Zig
