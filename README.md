# docker-haskell-custom

Custom Docker images for Haskell.

Sometimes the official images lag a bit. This uses `ghcup` to assemble reasonable images for recent compiler releases and pushes them to `ejconlon/haskell-custom` on [DockerHub](https://hub.docker.com/repository/docker/ejconlon/haskell-custom).

## Use with Stack

Here's an example `stack.yaml` that will let you build with `stack build --docker`:

    resolver: lts-17.5

    docker:
        enable: false
        repo: "ejconlon/haskell-custom:8.10.4"
        stack-exe: image

    packages:
    - .

## GHC versions

Images are built for the following GHC versions:

* 8.10.3
* 8.10.4
* 9.0.1

All images come with stack 2.5.1, cabal-install 3.2.0.0.

Images are named `ejconlon/haskell-custom:${GHC_VERSION}`.

## Usage

    # Fill in your dockerhub username
    # By default, it's mine (ejconlon)
    export NAMESPACE=...

    # Build an image
    ./script/build.sh ${GHC_VER}

    # Drop into a shell to test it out
    ./script/repl.sh ${GHC_VER}

    # Push it to dockerhub
    ./script/push.sh ${GHC_VER}

    # Build and push a bunch of versions
    ./script/all.sh

## License

The `Dockerfile` here is based on the one from the official Haskell image builder. It is [MIT-licensed](https://github.com/haskell/docker-haskell/blob/master/LICENSE) and this follows.
