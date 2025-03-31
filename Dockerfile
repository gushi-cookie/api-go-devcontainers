FROM golang:1.24.1

ARG CONTAINER_UID
ARG CONTAINER_GID
RUN test -n "$CONTAINER_UID"
RUN test -n "$CONTAINER_GID"

RUN apt-get update -y && \
    apt-get install -y manpages-dev manpages man-db less nano

RUN groupadd --gid ${CONTAINER_GID} developer && \
    useradd --uid ${CONTAINER_UID} --gid developer --shell /bin/bash --create-home developer

RUN su -c "mkdir -p ~/.vscode-server" developer

CMD ["sleep", "infinity"]