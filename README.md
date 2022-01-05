This is an Alpine image with the [Tugboat
CLI](https://docs.tugboat.qa/tugboat-cli/) tool installed. The entrypoint of the
image is `tugboat` so you can pass arguments to it using `docker run`. This is
image is mostly useful for CI environments such as GitHub Actions.

## Examples:

### Read the token using an environment variable
This example reads your token in using an environment variable to run `tugboat ls previews`.
```
docker run -it --rm \
  --env TUGBOAT_API_TOKEN=$TUGBOAT_API_TOKEN tugboatqa/cli \
  ls previews
```

### Read the token from your .tugboat.yml
This example runs `tugboat ls previews` by bind mounting your `~/.tugboat.yml` file
with your auth token into a Docker container.
```
docker run -it --rm \
  --mount type=bind,source=$HOME/.tugboat.yml,target=/root/.tugboat.yml,readonly \
  tugboatqa/cli \
  ls previews
```

### Use the image in a GitHub Actions workflow:
```
jobs:
  tugboat:
    name: Find Previews
    runs-on: ubuntu-latest
    container:
      image: tugboatqa/cli
      env:
        TUGBOAT_API_TOKEN: ${{ secrets.TUGBOAT_API_TOKEN }}
    steps:
      - run: tugboat ls previews repo=${{ secrets.TUGBOAT_REPO }}
```