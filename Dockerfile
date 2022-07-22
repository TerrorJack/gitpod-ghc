FROM archlinux:base

ARG UID=33333
ARG USER=gitpod

RUN \
  sed -i '/^NoExtract/d' /etc/pacman.conf && \
  pacman --noconfirm -Syu \
    asciinema \
    base-devel \
    bash-completion \
    bear \
    ccls \
    cmake \
    direnv \
    docker \
    gdb \
    git-lfs \
    gnome-keyring \
    htop \
    jq \
    libdwarf \
    lld \
    llvm \
    man-db \
    mold \
    mosh \
    nano \
    ninja \
    npm \
    numactl \
    parallel \
    python-pip \
    python-sphinx \
    python-virtualenv \
    ripgrep \
    rsync \
    strace \
    sudo \
    tailscale \
    tmate \
    unzip \
    valgrind && \
  pacman --noconfirm -Scc && \
  rm -rf /var/cache/pacman/* && \
  echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
  chmod 0440 /etc/sudoers.d/wheel && \
  useradd -G wheel -m -u ${UID} ${USER}

USER ${USER}

WORKDIR /home/${USER}

ENV \
  NIX_PROFILES="/nix/var/nix/profiles/default /home/${USER}/.nix-profile" \
  NIX_SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt" \
  PATH="/home/${USER}/.cabal/bin:/home/${USER}/.ghcup/bin:/home/${USER}/.cargo/bin:/home/${USER}/.local/bin:/home/${USER}/.nix-profile/bin:${PATH}"

RUN \
  cd /tmp && \
  curl -L https://aur.archlinux.org/cgit/aur.git/snapshot/aura-bin.tar.gz | tar xz && \
  cd aura-bin && \
  makepkg && \
  sudo pacman -U --noconfirm *.tar.zst && \
  cd .. && \
  sudo aura --noconfirm -A \
    proot-bin && \
  sudo rm -rf \
    /tmp/* \
    /var/cache/pacman/* \
    /var/tmp/*
