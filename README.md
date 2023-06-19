# jemalloc-docker-iamge

Jemalloc Docker Image used to copy compiled jemalloc to another image.

## Usage ##

```dockerfile
ARG BASE_IMAGE=ruby:3.2.2

# Used to copy jemalloc from pre built image
FROM ghcr.io/shpml/jemalloc-docker-image:main as jemalloc_build

# Deployment image built from here
FROM ${BASE_IMAGE}

ENV APP_HOME /app
ENV RAILS_ENV production

WORKDIR $APP_HOME

# copy compiled jemalloc
COPY --from=jemalloc_build /usr/local/lib/libjemalloc.so.2 /usr/local/lib/
ENV LD_PRELOAD=/usr/local/lib/libjemalloc.so.2
```
