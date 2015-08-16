#!/usr/bin/env bash
# http://stackoverflow.com/questions/25292198/docker-how-can-i-copy-a-file-from-an-image-to-a-host
mkdir -p output
id=$(docker create lukin0110/libsodium)
docker cp $id:/usr/local/libsodium output
docker rm -v $id
