#!/bin/bash

set -xeo pipefail

./compile.sh BOARD=star64 BRANCH=current RELEASE=jammy BUILD_MINIMAL=no \
  BUILD_DESKTOP=yes BUILD_ONLY=kernel KERNEL_CONFIGURE=no \
  DESKTOP_ENVIRONMENT=xfce DESKTOP_ENVIRONMENT_CONFIG_NAME=config_base \
  DESKTOP_APPGROUPS_SELECTED="internet" COMPRESS_OUTPUTIMAGE=sha,gpg,img \
  OFFLINE_WORK=yes "$@"

rsync -av output/debs/linux-{dtb,image}-current-jh7110*_riscv64.deb root@star64.home:/opt/
ssh root@star64.home "dpkg -i /opt/*.deb"
