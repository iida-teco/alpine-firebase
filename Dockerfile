FROM alpine:latest
RUN \
    apk update && \
    apk add --no-cache bash python g++ make linux-headers curl yarn && \
    touch ~/.bashrc && \
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

SHELL ["/bin/bash", "-c"]

RUN \
    source ~/.bashrc && \
    nvm install -s 6.11.5 && \
    nvm install -s 8.11.1 && \
    nvm alias default 8.11.1 && \
    yarn global add firebase-tools && \
    nvm cache clear && \
    yarn cache clean
