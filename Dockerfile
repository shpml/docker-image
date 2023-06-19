ARG DEBIAN_IMAGE=debian:stable-slim
JEMALLOC_VERSION="5.0.0"
# Build jemalloc on debian, to copy later.
FROM ${DEBIAN_IMAGE}
WORKDIR /tmp

ENV JEMALLOC_VERSION=${JEMALLOC_VERSION}

RUN apt-get update -qq && apt-get install build-essential curl -qq -y &&\
    curl -sL "https://github.com/jemalloc/jemalloc/releases/download/${JEMALLOC_VERSION}/jemalloc-${JEMALLOC_VERSION}.tar.bz2" | tar -xj --no-same-owner &&\
    cd "jemalloc-${JEMALLOC_VERSION}" &&\
    ./configure > /dev/null && make -j > /dev/null && make install > /dev/null &&\
    make clean > /dev/null && cd .. && rm -fr "jemalloc-${JEMALLOC_VERSION}" > /dev/null
