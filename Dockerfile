FROM alpine:latest

RUN apk add --no-cache libstdc++ curl ca-certificates jq wget && \
  wget https://dashboard.tugboat.qa/cli/alpine/tugboat.tar.gz && \
  tar -xvzf tugboat.tar.gz && \
  mv tugboat /usr/local/bin && \
  rm tugboat.tar.gz && \
  adduser -S tugboat

# Tell docker that all future commands should run as the appuser user
USER tugboat

VOLUME /home/tugboat

ENTRYPOINT ["tugboat"]
