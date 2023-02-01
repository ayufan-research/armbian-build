#!/bin/bash

set -xeo pipefail

git -C cache/sources/linux-star64/star64-5.15 diff drivers/gpu/drm/ | sudo tee patch/kernel/star64-current/01-gpu-custom-resolutions.patch
git -C cache/sources/linux-star64/star64-5.15 diff arch/riscv/ | sudo tee patch/kernel/star64-current/02-arch-riscv.patch
git -C cache/sources/linux-star64/star64-5.15 diff drivers/clk/ | sudo tee patch/kernel/star64-current/03-drivers-clk.patch

./compile.sh BOARD=star64 BRANCH=current RELEASE=jammy BUILD_MINIMAL=no \
  BUILD_DESKTOP=yes BUILD_ONLY=kernel KERNEL_CONFIGURE=no \
  DESKTOP_ENVIRONMENT=xfce DESKTOP_ENVIRONMENT_CONFIG_NAME=config_base \
  DESKTOP_APPGROUPS_SELECTED="internet" COMPRESS_OUTPUTIMAGE=sha,gpg,img \
  OFFLINE_WORK=yes BUILD_KSRC=no \
  "$@"

rsync -av output/debs/linux-{dtb,image}-current-jh7110*_riscv64.deb root@star64.home:/opt/
ssh root@star64.home "dpkg -i /opt/*.deb"
