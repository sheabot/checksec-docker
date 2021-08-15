# checksec-docker

Docker container with checksec.sh. A little tool for quickly surveying the mitigation technologies in use by processes on a Linux system.

## checksec.sh

https://www.trapkit.de/tools/checksec/

https://github.com/slimm609/checksec.sh


## Docker Hub

This repo is automatically built by Docker Hub.

https://hub.docker.com/repository/docker/sheabot/checksec


## Run

These commands mount the current working directory as a volume into the container at `/workspace` which is the $WORKDIR in the container. This allows checksec.sh to operate on files in the current directory.

```
docker run -it --rm -v "$(pwd):/workspace" -w /workspace sheabot/checksec arg1 arg2 ...
```

Example:

```
docker run -it --rm -v "$(pwd):/workspace" -w /workspace sheabot/checksec --file app
```


## Install

The `checksec.sh` script can be installed somewhere on $PATH to make running this containerized version of checksec.sh transparent.

```
install -m 0755 checksec.sh /usr/local/bin/checksec
```

Example:

```
checksec --file app
```
