#!/bin/bash

exec ./compile.sh BOARD=star64 BRANCH=current RELEASE=jammy BUILD_MINIMAL=no BUILD_DESKTOP=yes BUILD_ONLY=default KERNEL_CONFIGURE=no DESKTOP_ENVIRONMENT=xfce DESKTOP_ENVIRONMENT_CONFIG_NAME=config_base DESKTOP_APPGROUPS_SELECTED="internet" COMPRESS_OUTPUTIMAGE=sha,gpg,img "$@"
