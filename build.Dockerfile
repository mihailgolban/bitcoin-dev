FROM bitcoin-alpine-dev

#
# Clone the defined branch from the github repository to 
# get the sourcecode
#
RUN git clone https://github.com/bitcoin/bitcoin --branch v0.20.1 --single-branch