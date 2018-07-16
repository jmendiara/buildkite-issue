FROM ubuntu:16.04

COPY --from=docker:18.05.0-ce /usr/local/bin/docker /usr/local/bin/docker
