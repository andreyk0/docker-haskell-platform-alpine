#
# Using ideas/artifacts from
#   https://www.fpcomplete.com/blog/2016/10/static-compilation-with-stack
# (now merged to alpine edge)
#
# Used to compile static linux binaries with stack / GHC.
#
FROM alpine:edge

RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk update \
 && apk add \
        alpine-sdk \
        bash \
        ca-certificates \
        cabal@testing \
        ghc-dev@testing \
        ghc@testing \
        git \
        gmp-dev \
        gnupg \
        libffi-dev \
        linux-headers \
        perl-utils \
        upx@testing \
        wget \
        xz \
        zlib-dev

# Haskell stack
# TODO: this is not available at the moment
#RUN wget -qO- https://get.haskellstack.org/ | sh

# Grab a recent static binary of Stack
RUN cd /tmp \
 && wget https://github.com/commercialhaskell/stack/releases/download/v1.9.0.1/stack-1.9.0.1-linux-x86_64-static.tar.gz \
 && (cat stack*.tar.gz | shasum -a 256 | grep d7ed4ae8dc2ffe136b5f2dc3c41ccfe9d51be58c5d3dbf190f2372ed36207da9) \
 && tar xvf stack-*.tar.gz \
 && mv -v stack*static/stack /usr/local/bin/stack \
 && rm -rf /tmp/stack-* \
 && chmod 755 /usr/local/bin/stack


CMD [ "/bin/bash" ]
