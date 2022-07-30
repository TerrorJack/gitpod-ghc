FROM ubuntu:22.04

ARG UID=33333
ARG USER=gitpod
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  yes | unminimize && \
  apt install -y \
    curl \
    gnupg \
    software-properties-common && \
  curl -L https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/llvm-snapshot.gpg && \
  echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-14 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-13 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  curl -L https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg && \
  echo "deb https://deb.nodesource.com/node_18.x jammy main" >> /etc/apt/sources.list.d/nodesource.list && \
  curl -L https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg && \
  echo "deb https://cli.github.com/packages stable main" > /etc/apt/sources.list.d/github-cli.list && \
  curl -L https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg && \
  echo "deb https://download.docker.com/linux/ubuntu jammy stable" >> /etc/apt/sources.list.d/docker.list && \
  curl -L https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg -o /usr/share/keyrings/tailscale-archive-keyring.gpg && \
  curl -L https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list -o /etc/apt/sources.list.d/tailscale.list && \
  add-apt-repository -y ppa:git-core/ppa && \
  add-apt-repository -y ppa:ubuntu-toolchain-r/ppa && \
  apt full-upgrade -y && \
  apt install -y \
    asciinema \
    automake \
    bash-completion \
    bear \
    bison \
    build-essential \
    ccache \
    chrpath \
    clang-format-14 \
    clang-tools-14 \
    clangd-14 \
    cmake \
    creduce \
    csmith \
    dbus-x11 \
    direnv \
    docker-ce \
    doxygen \
    flex \
    gawk \
    gcc-11-plugin-dev \
    gdb \
    gh \
    ghostscript \
    git-annex \
    git-lfs \
    gnome-keyring \
    htop \
    jq \
    libdw-dev \
    libfuzzer-14-dev \
    libgmp-dev \
    libnuma-dev \
    libtool-bin \
    lld-14 \
    llvm-14-dev \
    locales-all \
    man-db \
    mosh \
    nano \
    neofetch \
    ninja-build \
    nodejs \
    pandoc \
    parallel \
    patchelf \
    pkg-config \
    psmisc \
    python-dev-is-python3 \
    python3-clang-14 \
    python3-full \
    python3-sphinx \
    python3-virtualenv \
    python3-z3 \
    rapidjson-dev \
    rclone \
    ripgrep \
    shellcheck \
    shfmt \
    strace \
    sudo \
    supervisor \
    tailscale \
    time \
    tk-dev \
    tmate \
    unzip \
    valgrind \
    xutils-dev \
    z3 \
    zstd && \
  cd $(mktemp -d) && \
  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install playwright && \
  npx playwright install-deps && \
  cd $(mktemp -d) && \
  curl -L https://github.com/profclems/glab/releases/download/v1.22.0/glab_1.22.0_Linux_x86_64.deb -O && \
  dpkg -i glab_1.22.0_Linux_x86_64.deb && \
  apt purge -y \
    mawk && \
  apt autoremove --purge -y && \
  cp -a /etc/skel/. /root && \
  echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudo && \
  chmod 0440 /etc/sudoers.d/sudo && \
  useradd -G sudo -m -u ${UID} ${USER} && \
  mkdir /run/tailscale && \
  chown ${UID} /run/tailscale && \
  touch /home/${USER}/.sudo_as_admin_successful && \
  rm -rf \
    /root/.launchpadlib \
    /root/.npm \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

USER ${USER}

WORKDIR /home/${USER}

ENV \
  NIX_PROFILES="/nix/var/nix/profiles/default /home/${USER}/.nix-profile" \
  NIX_SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt" \
  PATH="/home/${USER}/.cabal/bin:/home/${USER}/.ghcup/bin:/home/${USER}/.cargo/bin:/home/${USER}/.deno/bin:/home/${USER}/.local/bin:/home/${USER}/.nix-profile/bin:${PATH}"
