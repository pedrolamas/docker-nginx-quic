# syntax = docker/dockerfile:1.4

## build

FROM alpine as build

RUN <<eot
  apk update
  apk add --no-cache \
    cmake \
    g++ \
    gcc \
    git \
    go \
    libffi-dev \
    libunwind-dev \
    make \
    mercurial \
    ninja \
    pcre2-dev \
    perl \
    rng-tools
  rm -f /tmp/* /etc/apk/cache/* /root/.cache
eot

WORKDIR /build

RUN <<eot
  git clone --depth 1 https://boringssl.googlesource.com/boringssl
  (
    cd boringssl
    mkdir build
    (
      cd build
      cmake -GNinja ..
      ninja crypto ssl
    )
  )
eot

RUN <<eot
  hg clone https://hg.nginx.org/nginx-quic
  (
    cd nginx-quic
    hg update quic
    auto/configure \
      `nginx -V 2>&1 | sed "s/ \-\-/ \\\ \n\t--/g" | grep "\-\-" | grep -ve opt= -e param= -e build=` \
      --build=nginx-quic \
      --with-debug  \
      --with-http_v3_module \
      --with-stream_quic_module \
      --with-cc-opt="-I../boringssl/include" \
      --with-ld-opt="-L../boringssl/build/ssl -L../boringssl/build/crypto"
    make
  )
eot

## final

FROM nginx:alpine as final

COPY --from=build /build/nginx-quic/objs/nginx /usr/sbin
