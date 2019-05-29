FROM iidateco/alpine-nvm-node:v8.15.0 as node8
FROM iidateco/alpine-nvm-node:v10.15.3 as node10
FROM iidateco/alpine-nvm

COPY --from=node8 /root/.nvm/versions/node/v8.15.0 /root/.nvm/versions/node/v8.15.0
COPY --from=node10 /root/.nvm/versions/node/v10.15.3 /root/.nvm/versions/node/v10.15.3

SHELL ["/bin/bash", "-c"]

RUN \
    source ~/.bashrc && \
    apk update && \
    apk add --no-cache yarn openjdk8 && \
    nvm alias default 8.15.0 && \
    yarn global add firebase-tools --ignore-engines && \
    yarn cache clean
