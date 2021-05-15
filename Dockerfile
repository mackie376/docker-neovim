FROM debian:buster-slim as build
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
      apt-get update && \
      apt-get install -y --no-install-recommends \
        automake \
        ca-certificates \
        cmake \
        curl \
        g++ \
        gettext \
        libtool-bin \
        make \
        pkg-config \
        unzip && \
      curl -SL https://github.com/neovim/neovim/archive/refs/tags/nightly.tar.gz | tar xz && \
      cd neovim-nightly && \
      make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DENABLE_JEMALLOC=OFF -DCMAKE_INSTALL_PREFIX=/opt/nvim" && \
      make install


FROM node:14.17.0-buster-slim
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

ARG USER=user
ARG GROUP=user
ARG PASS=password
ARG UID=1000
ARG GID=1000

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN \
      apt-get update && \
      apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        g++ \
        git \
        git-lfs \
        gnupg \
        less \
        locales \
        ripgrep \
        sudo && \
      userdel -r node && \
      groupadd -g "$GID" "$GROUP" && \
      useradd -m -s /bin/bash -u "$UID" -g "$GID" "$USER" && \
      usermod -aG sudo "$USER" && \
      echo "${USER}:${PASS}" | chpasswd && \
      sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen && \
      locale-gen && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

COPY --from=build /opt/nvim /opt/nvim
COPY "${PWD}/conf.d" "/home/${USER}/.config/nvim"
RUN chown -R "${USER}:${GROUP}" "/home/${USER}/.config"

USER "$USER"
WORKDIR "/home/${USER}"

ENV SHELL=/bin/bash \
    LANGUAGE=en_US:en \
    LANG=ja_JP.UTF-8

RUN \
      echo 'export PATH=/opt/nvim/bin:${HOME}/.yarn/bin:$PATH' >> ~/.bashrc && \
      /opt/nvim/bin/nvim +qa

ENTRYPOINT ["/bin/bash"]
