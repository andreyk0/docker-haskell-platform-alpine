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
        upx@testing \
        xz \
        zlib-dev

# Haskell stack
# TODO: this is not available at the moment
#RUN wget -qO- https://get.haskellstack.org/ | sh

# Grab a recent static binary of Stack
ADD https://github.com/nh2/stack/releases/download/v1.6.5/stack-1.7.1-x86_64-unofficial-fully-static-musl /usr/local/bin/stack
RUN chmod 755 /usr/local/bin/stack

CMD [ "/bin/bash" ]
