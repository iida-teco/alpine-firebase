FROM iidateco/alpine-nvm-node:v8.11.1 as node8
FROM iidateco/alpine-nvm

COPY --from=node8 /root/.nvm/versions/node/v8.11.1 /root/.nvm/versions/node/v8.11.1

SHELL ["/bin/bash", "-c"]

RUN \
    source ~/.bashrc && \
    apk update && \
    apk add --no-cache yarn openjdk8 && \
    nvm alias default 8.11.1 && \
    yarn global add firebase-tools && \
    yarn cache clean
