FROM alpine:3.12
RUN apk update && apk add git \
                          make \
                          file \
                          autoconf \
                          automake \
                          build-base \
                          libtool \
                          db-c++ \
                          db-dev \
                          boost-system \
                          boost-program_options \
                          boost-filesystem \
                          boost-dev \
                          libressl-dev \
                          libevent-dev