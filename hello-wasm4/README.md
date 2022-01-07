# Hello-WASM4

This folder contains two docker-compose files to test the current versions of the WASM4 docker images.

## Usage

```shell
# First create the projects
docker-compose -f docker-compose.create.yml up

# Stop docker-compose and change the permissions
docker-compose -f docker-compose.create.yml down
sudo chown -R $USER: hello-*

# Start the watch process
docker-compose -f docker-compose.watch.yml up -d
```