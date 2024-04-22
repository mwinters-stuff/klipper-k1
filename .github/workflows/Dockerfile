FROM ballaswag/guppydev:latest AS mipstools
FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-20.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
    gcc-arm-none-eabi srecord && \
    git config --global --add safe.directory /data

COPY --from=mipstools /toolchains/mips-gcc720-glibc229 /toolchains/mips-gcc720-glibc229

ENV PATH=/toolchains/mips-gcc720-glibc229/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /data
ENTRYPOINT ["/bin/bash", "./make-k1c.sh"]