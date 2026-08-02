FROM alpine:3.24

RUN apk add --no-cache libstdc++ curl ca-certificates jq wget && \
  wget https://assets.tugboatqa.com/cli/alpine/tugboat.tar.gz && \
  tar -xvzf tugboat.tar.gz && \
  mv tugboat /usr/local/bin && \
  rm tugboat.tar.gz

VOLUME /root

ENTRYPOINT ["tugboat"]
