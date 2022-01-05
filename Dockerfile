FROM alpine:latest

RUN apk add --no-cache curl ca-certificates jq wget && \
  wget https://dashboard.tugboat.qa/cli/alpine/tugboat.tar.gz && \
  tar -xvzf tugboat.tar.gz && \
  mv tugboat /usr/local/bin \

ENTRYPOINT ["tugboat"]
