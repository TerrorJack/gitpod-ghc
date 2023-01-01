FROM ubuntu:22.04

ARG UID=33333
ARG USER=gitpod
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  dpkg --add-architecture i386 && \
  yes | unminimize && \
  apt install -y \
    curl \
    gnupg \
    software-properties-common && \
  curl -f -L --retry 5 https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg && \
  echo "deb https://download.docker.com/linux/ubuntu jammy stable" >> /etc/apt/sources.list.d/docker.list && \
  curl -f -L --retry 5 https://packagecloud.io/github/git-lfs/gpgkey | gpg --dearmor -o /etc/apt/trusted.gpg.d/github_git-lfs-archive-keyring.gpg && \
  echo "deb https://packagecloud.io/github/git-lfs/ubuntu jammy main" >> /etc/apt/sources.list.d/github_git-lfs.list && \
  curl -f -L --retry 5 https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg && \
  echo "deb https://cli.github.com/packages stable main" >> /etc/apt/sources.list.d/github-cli.list && \
  curl -f -L --retry 5 https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/trusted.gpg.d/google.gpg && \
  echo "deb https://dl.google.com/linux/chrome/deb stable main" >> /etc/apt/sources.list.d/google.list && \
  curl -f -L --retry 5 https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/llvm-snapshot.gpg && \
  echo "deb https://apt.llvm.org/jammy llvm-toolchain-jammy main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb https://apt.llvm.org/jammy llvm-toolchain-jammy-15 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb https://apt.llvm.org/jammy llvm-toolchain-jammy-14 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb https://apt.llvm.org/jammy llvm-toolchain-jammy-13 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  curl -f -L --retry 5 https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft-prod.gpg && \
  echo "deb https://packages.microsoft.com/ubuntu/22.04/prod jammy main" >> /etc/apt/sources.list.d/microsoft-prod.list && \
  curl -f -L --retry 5 https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg && \
  echo "deb https://deb.nodesource.com/node_19.x jammy main" >> /etc/apt/sources.list.d/nodesource.list && \
  curl -f -L --retry 5 "https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub" | gpg --dearmor -o /etc/apt/trusted.gpg.d/prebuilt-mpr-archive-keyring.gpg && \
  echo "deb https://proget.makedeb.org prebuilt-mpr jammy" > /etc/apt/sources.list.d/prebuilt-mpr.list && \
  curl -f -L --retry 5 https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg -o /etc/apt/trusted.gpg.d/tailscale-archive-keyring.gpg && \
  echo "deb https://pkgs.tailscale.com/stable/ubuntu jammy main" >> /etc/apt/sources.list.d/tailscale.list && \
  curl -f -L --retry 5 https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/tor-archive-keyring.gpg && \
  echo "deb https://deb.torproject.org/torproject.org jammy main" > /etc/apt/sources.list.d/tor.list && \
  curl -f -L --retry 5 https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/winehq.gpg && \
  echo "deb https://dl.winehq.org/wine-builds/ubuntu jammy main" > /etc/apt/sources.list.d/winehq.list && \
  add-apt-repository -y ppa:git-core/ppa && \
  add-apt-repository -y ppa:plt/racket && \
  add-apt-repository -y ppa:rabbitmq/rabbitmq-erlang && \
  apt-add-repository -y ppa:swi-prolog/stable && \
  apt install -y \
    asciinema \
    automake \
    bash-completion \
    bear \
    bison \
    bolt-15 \
    ccache \
    chezscheme \
    chrpath \
    clang-format-15 \
    clang-tools-15 \
    clangd-15 \
    cmake \
    creduce \
    csmith \
    dbus-x11 \
    direnv \
    docker-ce \
    flex \
    g++ \
    gawk \
    gcc-11-plugin-dev \
    gdb \
    gh \
    ghostscript \
    git-annex \
    git-lfs \
    glab \
    gnome-keyring \
    htop \
    jq \
    libaria2-0-dev \
    libdw-dev \
    libfuzzer-15-dev \
    libgmp-dev \
    libgtk-3-dev \
    libncurses5 \
    libnuma-dev \
    libsodium-dev \
    libssl-dev \
    libuv1-dev \
    libxxhash-dev \
    libzstd-dev \
    lld-15 \
    llvm-15-dev \
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
    powershell \
    psmisc \
    python-dev-is-python3 \
    python3-clang-15 \
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
    texinfo \
    time \
    tk-dev \
    tmate \
    tor-geoipdb \
    unzip \
    valgrind \
    z3 \
    zip \
    zstd && \
  cp -a /etc/skel/. /root && \
  echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudo && \
  chmod 0440 /etc/sudoers.d/sudo && \
  useradd -G sudo -m -u ${UID} ${USER} && \
  mkdir /home/${USER}/.bashrc.d && \
  echo 'for i in $(ls -A $HOME/.bashrc.d); do source $HOME/.bashrc.d/$i; done' >> /home/${USER}/.bashrc && \
  echo "prefix = /home/${USER}/.local" >> /home/${USER}/.npmrc && \
  echo "update-notifier = false" >> /home/${USER}/.npmrc && \
  mkdir /run/dbus /run/tailscale && \
  chown -hR ${USER}:${USER} \
    /home/${USER} \
    /run/dbus \
    /run/tailscale && \
  cd /tmp && \
  su ${USER} -c 'export PATH=$HOME/.local/bin:$PATH && npm install -g n && N_PREFIX=$HOME/.local n latest && PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install playwright && npx playwright install-deps' && \
  rm \
    /etc/apt/sources.list.d/nodesource.list \
    /etc/apt/trusted.gpg.d/nodesource.gpg && \
  apt purge -y \
    mawk \
    nodejs && \
  add-apt-repository -y ppa:ubuntu-toolchain-r/ppa && \
  apt full-upgrade -y && \
  apt autoremove --purge -y && \
  rm -rf \
    /home/${USER}/.npm \
    /root/.launchpadlib \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

USER ${USER}

WORKDIR /home/${USER}

ENV \
  CAML_LD_LIBRARY_PATH="/home/${USER}/.opam/default/lib/stublibs:/home/${USER}/.opam/default/lib/ocaml/stublibs:/home/${USER}/.opam/default/lib/ocaml" \
  GITLAB_HOST=gitlab.haskell.org \
  LANG=en_US.utf8 \
  MANPATH=":/home/${USER}/.opam/default/man" \
  NIX_PROFILES="/nix/var/nix/profiles/default /nix/var/nix/profiles/per-user/${USER}/profile" \
  NIX_SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt" \
  N_PREFIX="/home/${USER}/.local" \
  OCAML_TOPLEVEL_PATH="/home/${USER}/.opam/default/lib/toplevel" \
  OPAM_SWITCH_PREFIX="/home/${USER}/.opam/default" \
  PATH="/home/${USER}/.cabal/bin:/home/${USER}/.ghcup/bin:/home/${USER}/.cargo/bin:/home/${USER}/.deno/bin:/home/${USER}/.elan/bin:/home/${USER}/.opam/default/bin:/home/${USER}/.pack/bin:/home/${USER}/.local/bin:/home/${USER}/.vcpkg:/nix/var/nix/profiles/per-user/${USER}/profile/bin:/usr/lib/llvm-15/bin:${PATH}" \
  VCPKG_ROOT="/home/${USER}/.vcpkg"
