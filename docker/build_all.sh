docker build -f dev.Dockerfile -t bitcoin-alpine-dev .
docker build -f build.Dockerfile -t bitcoin-alpine-build .
docker build -f bin.Dockerfile -t bitcoin-alpine-bin .
docker build -f node.Dockerfile -t bitcoin-alpine-node .
