#!/bin/bash

set -xeo pipefail

if [[ $(id -u) -ne 0 ]]; then
  sudo --preserve-env=SSH_AUTH_SOCK $0 "$@"
  exit 1
fi

export CCACHE=ccache
export PATH="/usr/lib/ccache:$PATH"
export CROSS_COMPILE="ccache riscv64-linux-gnu-"
export ARCH="riscv"
export ROOT="$PWD"
export LOCALVERSION="-dev"

export INSTALL_PATH="$ROOT/output/linux-star64"

pushd cache/sources/linux-star64/star64-dev/
set -xeo pipefail
mkdir -p "$INSTALL_PATH/boot"
make -j$(nproc)
make -j$(nproc) install modules_install dtbs_install \
  INSTALL_PATH="$INSTALL_PATH/boot" \
  INSTALL_MOD_PATH="$INSTALL_PATH"
popd

rsync -av "$INSTALL_PATH/." root@star64.home:/
