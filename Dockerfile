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
        libffi-dev \
        linux-headers \
        upx@testing \
        zlib-dev

# Haskell stack
RUN wget -qO- https://get.haskellstack.org/ | sh


# Stack options for static compilation,
# can be used as an environmental variable
# by scripts running inside a container.
#
# E.g.
#    stack --local-bin-path $(TARGET) install $(STACK_OPTS) package
#

ENV STACK_OPTS --system-ghc --skip-ghc-check --ghc-options '-optl-static'

CMD [ "/bin/bash" ]
