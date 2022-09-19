FROM ubuntu:latest
LABEL org.opencontainers.image.authors="abcfy2@163.com"

ARG ARCH=arm-linux-musleabi

ENV CROSS_HOST="${ARCH}"
ENV CROSS_ROOT="/cross_root"
ENV PATH="${CROSS_ROOT}/bin:${PATH}"
ENV CROSS_PREFIX="${CROSS_ROOT}/${CROSS_HOST}"

RUN export DEBIAN_FRONTEND=noninteractive && \
    mkdir -p "${CROSS_ROOT}" && \
    apt update && \
    apt install -y curl && \
    curl -SLfA "MacroMu" -o "/tmp/${ARCH}-cross.tgz" "https://musl.cc/${ARCH}-cross.tgz" && \
    SHA512SUMS="$(curl -sSLfA "MacroMu" --compressed https://musl.cc/SHA512SUMS)" && \
    SHA512SUM="$(echo "${SHA512SUMS}" | grep "${CROSS_HOST}-cross.tgz" | head -1)" && \
    cd /tmp && \
    echo "${SHA512SUM}" | sha512sum -c && \
    tar -zxf "/tmp/${ARCH}-cross.tgz" --transform='s|^\./||S' --strip-components=1 -C "${CROSS_ROOT}" && \
    rm -f "/tmp/${ARCH}-cross.tgz" && \
    echo "${SHA512SUM}" > /SHA512SUM.txt && \
    apt purge -y curl && \
    apt autoremove --purge -y && \
    rm -fr /var/lib/apt/*
