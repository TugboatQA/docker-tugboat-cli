FROM alpine:latest

RUN apk add --no-cache libstdc++ curl ca-certificates jq wget && \
  wget https://dashboard.tugboat.qa/cli/alpine/tugboat.tar.gz && \
  tar -xvzf tugboat.tar.gz && \
  mv tugboat /usr/local/bin && \
  rm tugboat.tar.gz

VOLUME /root

ENTRYPOINT ["tugboat"]
