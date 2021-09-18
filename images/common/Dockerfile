# Parameterized by args ARCH (aarch64/x86_64), and version numbers for GHC, CABAL_INSTALL, and STACK

FROM debian:bullseye

ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg ca-certificates dirmngr && \
    rm -rf /var/lib/apt/lists/*

ARG DEBIAN_KEY=427CB69AAC9D00F2A43CAF1CBA3CBA3FFE22B574

RUN export GNUPGHOME="$(mktemp -d)" && \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys ${DEBIAN_KEY} && \
    gpg --batch --armor --export ${DEBIAN_KEY} > /etc/apt/trusted.gpg.d/haskell.org.gpg.asc && \
    gpgconf --kill all && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        g++ \
        git \
        libgmp-dev \
        libnuma-dev \
        libsqlite3-dev \
        libtinfo5 \
        make \
        netbase \
        openssh-client \
        xz-utils \
        zlib1g-dev && \
    rm -rf "$GNUPGHOME" /var/lib/apt/lists/*

ARG ARCH
RUN curl -fSL https://downloads.haskell.org/~ghcup/${ARCH}-linux-ghcup -o /usr/local/bin/ghcup && \
    chmod +x /usr/local/bin/ghcup && \
    ghcup upgrade -if && \
    mkdir -p /root/.local/bin /root/.cabal/bin

ENV PATH /root/.local/bin:/root/.cabal/bin:/root/.ghcup/bin:$PATH

ARG GHC
RUN ghcup install ghc ${GHC} --set

ARG CABAL_INSTALL
RUN ghcup install cabal ${CABAL_INSTALL} --set

ARG STACK
RUN ghcup install stack ${STACK} --set && \
    stack config set system-ghc --global true && \
    stack config set install-ghc --global false

CMD ["ghci"]
