FROM alpine:3.24

# --upgrade pulls current versions of these packages *and* their dependencies.
# Without it, libssl3/libcrypto3 and musl stay at whatever the base image last
# shipped, which can be months behind the Alpine repository.
RUN apk add --no-cache --upgrade libstdc++ curl ca-certificates jq wget && \
  wget --progress=dot:giga https://assets.tugboatqa.com/cli/alpine/tugboat.tar.gz && \
  tar -xvzf tugboat.tar.gz && \
  mv tugboat /usr/local/bin && \
  rm tugboat.tar.gz

VOLUME /root

ENTRYPOINT ["tugboat"]
