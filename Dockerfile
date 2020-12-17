FROM ubuntu:20.04

# Set shell to bash instead of dash
ARG DEBIAN_FRONTEND=noninteractive
RUN echo "dash dash/sh boolean false" | debconf-set-selections && dpkg-reconfigure dash

# Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    binutils \
    build-essential \
    ca-certificates \
    curl \
    file && \
    rm -rf /var/lib/apt/lists/*

# Install checksec.sh
RUN curl -Ls https://raw.githubusercontent.com/slimm609/checksec.sh/master/checksec -o /usr/local/bin/checksec && \
    chmod +x /usr/local/bin/checksec

# Workspace volume from host
VOLUME [ "/workspace" ]
WORKDIR /workspace

# Call checksec executable with arguments
ENTRYPOINT [ "checksec" ]
