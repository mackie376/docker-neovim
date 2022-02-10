FROM debian:bullseye-slim as build
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG NVIM_VER=0.6.1

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=nointeractive apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    ca-certificates \
    cmake \
    curl \
    doxygen \
    g++ \
    gettext \
    gzip \
    libtool \
    libtool-bin \
    make \
    ninja-build \
    pkg-config \
    unzip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir /root/workspace && \
  curl -L "https://github.com/neovim/neovim/archive/refs/tags/v${NVIM_VER}.tar.gz" | tar xz -C /root/workspace && \
  cd "/root/workspace/neovim-${NVIM_VER}" && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  cd / && \
  rm -rf /root/workspace

## -------------------------------------------------------------------------

FROM node:16.13.2-bullseye-slim
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG USER=user
ARG GROUP=user
ARG PASS=password
ARG UID=1000
ARG GID=1000
ARG LANG='ja_JP.UTF-8'

ARG STARSHIP_VER=1.3.0
ARG BAT_VER=0.19.0
ARG FD_VER=8.3.2
ARG GH_VER=2.5.0

COPY --from=build /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=build /usr/local/share/locale /usr/local/share/locale
COPY --from=build /usr/local/share/nvim /usr/local/share/nvim
COPY --from=build /usr/local/lib/nvim /usr/local/lib/nvim
COPY "${PWD}/entrypoint.zsh" /usr/local/bin

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=nointeractive apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    g++ \
    git \
    git-lfs \
    gnupg \
    less \
    locales \
    make \
    openssh-client \
    ripgrep \
    rsync \
    sudo \
    unzip \
    wget \
    zsh && \
  userdel -r node && \
  groupadd -g "${GID}" "${GROUP}" && \
  useradd -m -s /usr/bin/zsh -u "${UID}" -g "${GID}" "${USER}" && \
  usermod -aG sudo "${USER}" && \
  echo "${USER}:${PASS}" | chpasswd && \
  sed -i -E "s/# (${LANG})/\1/" /etc/locale.gen && \
  locale-gen && \
  curl -L "https://github.com/starship/starship/releases/download/v${STARSHIP_VER}/starship-x86_64-unknown-linux-musl.tar.gz" | tar xz -C /usr/local/bin && \
  curl -L "https://github.com/sharkdp/bat/releases/download/v${BAT_VER}/bat-v${BAT_VER}-x86_64-unknown-linux-musl.tar.gz" | sudo sh -c "tar xz -O bat-v${BAT_VER}-x86_64-unknown-linux-musl/bat > /usr/local/bin/bat" && \
  curl -L "https://github.com/sharkdp/fd/releases/download/v${FD_VER}/fd-v${FD_VER}-x86_64-unknown-linux-musl.tar.gz" | sudo sh -c "tar xz -O fd-v${FD_VER}-x86_64-unknown-linux-musl/fd > /usr/local/bin/fd" && \
  curl -L "https://github.com/cli/cli/releases/download/v${GH_VER}/gh_${GH_VER}_linux_amd64.tar.gz" | sudo sh -c "tar xz -O gh_${GH_VER}_linux_amd64/bin/gh > /usr/local/bin/gh" && \
  chown root:root /usr/local/bin/starship && \
  chmod +x /usr/local/bin/bat /usr/local/bin/fd /usr/local/bin/gh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER "${USER}"
WORKDIR "/home/${USER}"

ENV \
  SHELL=/usr/bin/zsh \
  LANGUAGE="${LANG}" \
  LANG="${LANG}"

RUN \
  mkdir -p .config .cache .local/share workspace && \
  git clone --recursive https://github.com/sorin-ionescu/prezto.git .config/prezto

COPY --chown="${USER}:${GROUP}" "${PWD}/conf.d/zsh/.zshenv" "/home/${USER}/.zshenv"
COPY --chown="${USER}:${GROUP}" "${PWD}/conf.d/zsh" "/home/${USER}/.config/zsh"
COPY --chown="${USER}:${GROUP}" "${PWD}/conf.d/neovim" "/home/${USER}/.config/nvim"

ENTRYPOINT ["/usr/local/bin/entrypoint.zsh"]
