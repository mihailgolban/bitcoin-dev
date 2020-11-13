FROM bitcoin-alpine-bin as build

RUN echo "In build stage"

FROM alpine

#
# Copy the binaries from the build to our new container
#
COPY --from=build /usr/local/bin/bitcoind /usr/local/bin
COPY --from=build /usr/local/bin/bitcoin-cli /usr/local/bin

#
# Install all dependencies
#
RUN apk update && apk add boost boost-filesystem \
            boost-program_options \
            boost-system boost-thread busybox db-c++ \
            libevent libgcc libressl \
            libstdc++ musl