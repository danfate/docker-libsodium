#
# libsodium Dockerfile
#
# https://github.com/lukin0110/docker-libsodium
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Maarten Huijsmans <maarten.huijsmans@gmail.com>

# Install some tools: gcc build tools, unzip, etc
RUN apt-get update && apt-get -y upgrade && apt-get -y install curl build-essential unzip

# Download and install libsodium
# https://download.libsodium.org/doc/

# Download & extract
RUN mkdir -p /tmpbuild/libsodium
WORKDIR /tmpbuild/libsodium
RUN curl -L https://download.libsodium.org/libsodium/releases/libsodium-1.0.3.tar.gz -o libsodium-1.0.3.tar.gz && \
    tar xfvz libsodium-1.0.3.tar.gz

WORKDIR /tmpbuild/libsodium/libsodium-1.0.3/

# Make libsodium
RUN ./configure
RUN make && make check
RUN make install

# Move libsodium build
RUN mv src/libsodium /usr/local/

WORKDIR /root
RUN rm -Rf /tmpbuild/

# Define default command
CMD ["bash"]
