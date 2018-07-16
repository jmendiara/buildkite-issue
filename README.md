# buildkite-issue

Building DockerFile in an AWS elastic CI stack with `EnableDockerUserNamespaceRemap=true` fails with the Dockerfile

```Dockerfile
FROM ubuntu:16.04

COPY --from=docker:18.05.0-ce /usr/local/bin/docker /usr/local/bin/docker
```

with the following error
```sh
docker run -ti --rm buildkite-issue docker version
 
Sending build context to Docker daemon  68.61kB
Step 1/2 : FROM ubuntu:16.04
16.04: Pulling from library/ubuntu
b234f539f7a1: Pull complete
55172d420b43: Pull complete
5ba5bbeb6b91: Pull complete
43ae2841ad7a: Pull complete
f6c9c6de4190: Pull complete
Digest: sha256:b050c1822d37a4463c01ceda24d0fc4c679b0dd3c43e742730e2884d3c582e3a
Status: Downloaded newer image for ubuntu:16.04
 ---> 5e8b97a2a082
Step 2/2 : COPY --from=docker:18.05.0-ce /usr/local/bin/docker /usr/local/bin/docker
18.05.0-ce: Pulling from library/docker
911c6d0c7995: Pull complete
aff9b9c51076: Pull complete
9500841639b7: Pull complete
7224669f3f31: Pull complete
0134575d2ad9: Pull complete
e7d8d8ae52f7: Pull complete
Digest: sha256:8730b4565178d360ae7a78b59e504406838a855f1097ac36ecdd8aa58a53bc61
Status: Downloaded newer image for docker:18.05.0-ce
failed to copy files: failed to copy file: Container ID 100999 cannot be mapped to a host ID
```

Executing in my host the following command gives
```sh
$ docker run --rm docker:18.05.0-ce sh -c "ls -la /usr/local/bin/docker" 
-rwxr-xr-x    1 root     1000      37736758 May  9 22:21 /usr/local/bin/docker
```


