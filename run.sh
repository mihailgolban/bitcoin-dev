#
# Run a container with port 18332 (regtest) exposed
#
docker run -it --net=bridge --name=bitcoin-alpine -p 18332:18332  bitcoin-alpine