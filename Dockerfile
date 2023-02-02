FROM ubuntu:22.10

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
  echo "deb https://download.docker.com/linux/ubuntu kinetic stable" >> /etc/apt/sources.list.d/docker.list && \
  curl -f -L --retry 5 https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg && \
  echo "deb https://cli.github.com/packages stable main" >> /etc/apt/sources.list.d/github-cli.list && \
  curl -f -L --retry 5 https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/trusted.gpg.d/google.gpg && \
  echo "deb https://dl.google.com/linux/chrome/deb stable main" >> /etc/apt/sources.list.d/google.list && \
  curl -f -L --retry 5 https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/llvm-snapshot.gpg && \
  echo "deb https://apt.llvm.org/kinetic llvm-toolchain-kinetic main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb https://apt.llvm.org/kinetic llvm-toolchain-kinetic-15 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  echo "deb https://apt.llvm.org/kinetic llvm-toolchain-kinetic-14 main" >> /etc/apt/sources.list.d/llvm-toolchain.list && \
  curl -f -L --retry 5 https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft-prod.gpg && \
  echo "deb https://packages.microsoft.com/ubuntu/22.10/prod kinetic main" >> /etc/apt/sources.list.d/microsoft-prod.list && \
  curl -f -L --retry 5 https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg && \
  echo "deb https://deb.nodesource.com/node_19.x kinetic main" >> /etc/apt/sources.list.d/nodesource.list && \
  curl -f -L --retry 5 "https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub" | gpg --dearmor -o /etc/apt/trusted.gpg.d/prebuilt-mpr-archive-keyring.gpg && \
  echo "deb https://proget.makedeb.org prebuilt-mpr kinetic" > /etc/apt/sources.list.d/prebuilt-mpr.list && \
  curl -f -L --retry 5 https://pkgs.tailscale.com/stable/ubuntu/kinetic.noarmor.gpg -o /etc/apt/trusted.gpg.d/tailscale-archive-keyring.gpg && \
  echo "deb https://pkgs.tailscale.com/stable/ubuntu kinetic main" >> /etc/apt/sources.list.d/tailscale.list && \
  curl -f -L --retry 5 https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/tor-archive-keyring.gpg && \
  echo "deb https://deb.torproject.org/torproject.org kinetic main" > /etc/apt/sources.list.d/tor.list && \
  curl -f -L --retry 5 https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/winehq.gpg && \
  echo "deb https://dl.winehq.org/wine-builds/ubuntu kinetic main" > /etc/apt/sources.list.d/winehq.list && \
  add-apt-repository -y ppa:git-core/ppa && \
  add-apt-repository -y ppa:pypy/ppa && \
  apt-add-repository -y ppa:swi-prolog/stable && \
  apt install -y \
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
    gcc-12-plugin-dev \
    gdb \
    gh \
    ghostscript \
    git-annex \
    git-lfs \
    glab \
    gnome-keyring \
    htop \
    jq \
    libdw-dev \
    libfuzzer-15-dev \
    libgmp-dev \
    libgtk-3-dev \
    libncurses5 \
    libnuma-dev \
    libssl-dev \
    libuv1-dev \
    libxxhash-dev \
    libzstd-dev \
    lldb-15 \
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
    psmisc \
    pypy3 \
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
    unzip \
    valgrind \
    z3 \
    zip \
    zstd && \
  cp -a /etc/skel/. /root && \
  echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudo && \
  chmod 0440 /etc/sudoers.d/sudo && \
  useradd -G sudo -m -u ${UID} ${USER} && \
  mkdir -p \
    /run/dbus \
    /run/tailscale \
    /workspace/.bashrc.d && \
  touch /home/${USER}/.sudo_as_admin_successful && \
  for f in .bash_history .bash_logout .bashrc .profile; do mv /home/${USER}/$f /workspace/$f && ln -s /workspace/$f /home/${USER}/$f; done && \
  echo 'for i in $(ls -A /workspace/.bashrc.d); do source /workspace/.bashrc.d/$i; done' >> /workspace/.bashrc && \
  chown -hR ${USER}:${USER} \
    /home/${USER} \
    /run/dbus \
    /run/tailscale \
    /workspace && \
  apt purge -y \
    mawk && \
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
  CAML_LD_LIBRARY_PATH="/workspace/.local/share/opam/default/lib/stublibs:/workspace/.local/share/opam/default/lib/ocaml/stublibs:/workspace/.local/share/opam/default/lib/ocaml" \
  GHCUP_USE_XDG_DIRS=1 \
  GITLAB_HOST=gitlab.haskell.org \
  LANG=en_US.utf8 \
  MANPATH=":/workspace/.local/share/opam/default/man" \
  NIX_PROFILES="/nix/var/nix/profiles/default /nix/var/nix/profiles/per-user/${USER}/profile" \
  NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
  NODE_REPL_HISTORY=/workspace/.local/share/node_repl_history \
  N_PREFIX=/workspace/.local/n \
  OCAML_TOPLEVEL_PATH="/workspace/.local/share/opam/default/lib/toplevel" \
  OPAMROOT=/workspace/.local/share/opam \
  OPAM_SWITCH_PREFIX="/workspace/.local/share/opam/default" \
  PARALLEL_HOME=/workspace/.config/parallel \
  PATH="/home/${USER}/.cargo/bin:/home/${USER}/.deno/bin:/home/${USER}/.elan/bin:/workspace/.local/share/opam/default/bin:/home/${USER}/.pack/bin:/workspace/.vcpkg:/workspace/.local/share/python/bin:/workspace/.local/n/bin:/workspace/.local/bin:/nix/var/nix/profiles/per-user/${USER}/profile/bin:/usr/lib/llvm-15/bin:${PATH}" \
  PYTHONPYCACHEPREFIX=/workspace/.cache/python \
  PYTHONUSERBASE=/workspace/.local/share/python \
  RIPGREP_CONFIG_PATH=/workspace/.config/ripgrep/config \
  VCPKG_ROOT=/workspace/.vcpkg \
  WINEPREFIX=/workspace/.local/share/wineprefixes/default \
  XDG_BIN_HOME=/workspace/.local/bin \
  XDG_CACHE_HOME=/workspace/.cache \
  XDG_CONFIG_HOME=/workspace/.config \
  XDG_DATA_HOME=/workspace/.local/share \
  XDG_STATE_HOME=/workspace/.local/state
