FROM iidateco/alpine-nvm-node:v6.11.5 as node6
FROM iidateco/alpine-nvm-node:v8.11.1 as node8
FROM iidateco/alpine-nvm

COPY --from=node6 /root/.nvm/versions/node/v6.11.5 /root/.nvm/versions/node/v6.11.5
COPY --from=node8 /root/.nvm/versions/node/v8.11.1 /root/.nvm/versions/node/v8.11.1

SHELL ["/bin/bash", "-c"]

RUN \
    source ~/.bashrc && \
    apk update && \
    apk add --no-cache yarn openjdk8 && \
    nvm alias default 8.11.1 && \
    nvm use 6.11.5 && \
    yarn global add firebase-tools && \
    yarn cache clean
