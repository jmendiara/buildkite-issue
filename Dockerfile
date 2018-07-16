FROM docker:18.05.0-ce as docker

RUN chown -R 0:0 /usr/local/bin/docker

FROM ubuntu:16.04

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
