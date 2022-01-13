VERSION=2.2.0

build: base as c d go nelua nim odin rust zig full
	@-

upload: base as c d go nelua nim odin rust zig full
	docker push anihex/wasm4:base
	docker push anihex/wasm4:${VERSION}-base
	docker push anihex/wasm4:as
	docker push anihex/wasm4:${VERSION}-as
	docker push anihex/wasm4:c
	docker push anihex/wasm4:${VERSION}-c
	docker push anihex/wasm4:d
	docker push anihex/wasm4:${VERSION}-d
	docker push anihex/wasm4:go
	docker push anihex/wasm4:${VERSION}-go
	docker push anihex/wasm4:nelua
	docker push anihex/wasm4:${VERSION}-nelua
	docker push anihex/wasm4:nim
	docker push anihex/wasm4:${VERSION}-nim
	docker push anihex/wasm4:odin
	docker push anihex/wasm4:${VERSION}-odin
	docker push anihex/wasm4:rust
	docker push anihex/wasm4:${VERSION}-rust
	docker push anihex/wasm4:zig
	docker push anihex/wasm4:${VERSION}-zig
	docker push anihex/wasm4:latest
	docker push anihex/wasm4:${VERSION}-full

base:
	docker build -t anihex/wasm4:base -f Dockerfiles/Dockerfile.base Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-base -f Dockerfiles/Dockerfile.base Dockerfiles/

as:
	docker build -t anihex/wasm4:assemblyscript -f Dockerfiles/Dockerfile.as Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-assemblyscript -f Dockerfiles/Dockerfile.as Dockerfiles/

c:
	docker build -t anihex/wasm4:c -f Dockerfiles/Dockerfile.c Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-c -f Dockerfiles/Dockerfile.c Dockerfiles/

d:
	docker build -t anihex/wasm4:d -f Dockerfiles/Dockerfile.d Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-d -f Dockerfiles/Dockerfile.d Dockerfiles/

go:
	docker build -t anihex/wasm4:go -f Dockerfiles/Dockerfile.go Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-go -f Dockerfiles/Dockerfile.go Dockerfiles/

nelua:
	docker build -t anihex/wasm4:nelua -f Dockerfiles/Dockerfile.nelua Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-nelua -f Dockerfiles/Dockerfile.nelua Dockerfiles/

nim:
	docker build -t anihex/wasm4:nim -f Dockerfiles/Dockerfile.nim Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-nim -f Dockerfiles/Dockerfile.nim Dockerfiles/

odin:
	docker build -t anihex/wasm4:odin -f Dockerfiles/Dockerfile.odin Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-odin -f Dockerfiles/Dockerfile.odin Dockerfiles/

rust:
	docker build -t anihex/wasm4:rust -f Dockerfiles/Dockerfile.rust Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-rust -f Dockerfiles/Dockerfile.rust Dockerfiles/

zig:
	docker build -t anihex/wasm4:zig -f Dockerfiles/Dockerfile.zig Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-zig -f Dockerfiles/Dockerfile.zig Dockerfiles/

full:
	docker build -t anihex/wasm4:latest -f Dockerfiles/Dockerfile.full Dockerfiles/
	docker build -t anihex/wasm4:${VERSION}-full -f Dockerfiles/Dockerfile.full Dockerfiles/

