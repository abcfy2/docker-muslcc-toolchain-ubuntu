# Docker musl.cc toolchain Ubuntu

This is the musl based toolchain from [musl.cc](https://musl.cc/).

Since official docker image [muslcc/i686](https://hub.docker.com/r/muslcc/i686) only supports Alpine based image, so I created a Ubuntu based image (always based on `ubuntu:latest`).

This is useful for some building environments which require a glibc based library.

Cross toolchain installed in `/cross_root`. And `/cross_root/bin` has been already appended to `PATH`, so you can use cross compiler like `arm-linux-musleabi-gcc -v` directly.

An useful example can be foundt at [abcfy2/aria2-static-build](https://github.com/abcfy2/aria2-static-build/blob/main/build.sh)
