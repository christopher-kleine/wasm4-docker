# wasm4

Docker image to create and develop games for the Fantasy Console [WASM-4](https://wasm4.org/).

## Image variants: anihex/wasm4:<VERSION>-<VARIANT>

All variants include the following tools:
- The `w4` CLI
- Binaryen (`wasm-opt` etc)

Aside from that, there currently there are the following variants: `full`, `assemblyscript`, `c`, `d`, `go`, `nelua`, `nim`, `odin`, `rust` and `zig`.

Almost all variants include the C-variant. Exceptions are `assemblyscript` and `go`.

Examples:
```shell
docker pull anihex/wasm4:2.1.0-full
docker pull anihex/wasm4:2.1.0-c
docker pull anihex/wasm4:latest   # Implicit full-variant
docker pull anihex/wasm4:go
```

## Usage

The default command is `w4 watch`. This can be changed by overriding the command. If a completely different command is required, the entrypoint needs to be overridden.

Examples:

```shell
docker run --rm -v $PWD:/cart -p 4444:4444 anihex/wasm4:latest      # Starts the watcher in the current directory
docker run --rm -v $PWD:/cart anihex/wasm4:latest new --c hello-c   # Creates a new project called hello-c
docker run --rm -it $PWD:/cart -entrypoint bash anihex/wasm4:latest # Starts the bash-terminal
```

## Ports

The default port is 4444. For examples, look at `Usage`.

## Mounts

The standard-mountpoint is `/cart`. For examples, look at `Usage`.

## Contributing

WASM-4 is OpenSource and is hosted on GitHub: https://github.com/aduros/wasm4<br>
The docker-files for this can be found on https://github.com/christopher-kleine/wasm4-docker