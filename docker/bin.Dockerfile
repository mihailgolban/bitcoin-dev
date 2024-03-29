FROM bitcoin-alpine-build

#
# Run the actual build using configure and make
# We build without tests and benchmarks and without GUI
#
RUN (cd bitcoin  && ./autogen.sh && \
                      ./configure --disable-tests \
                      --disable-bench --disable-static  \
                      --without-gui --disable-zmq \
                      --with-incompatible-bdb \
                      CFLAGS='-w' CXXFLAGS='-w' && \
                      make -j 4 && \
                      strip src/bitcoind && \
                      strip src/bitcoin-cli && \
                      strip src/bitcoin-tx && \
                      make install )