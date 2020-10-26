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

#
# Copy the bitcoin.conf file from
# the build context into the container
#
COPY bitcoin.conf /bitcoin.conf

#
# Copy the startup script from
# the build context into the container
#
COPY startup.sh /startup.sh

#
# Expose the port for the RPC interface
#
EXPOSE 18332/tcp

#
# Start the bitcoin server
#
ENTRYPOINT ["/startup.sh"]