#!/bin/bash

set -xeo pipefail

git -C cache/sources/linux-star64/star64-5.15 diff drivers/gpu/drm/ | sudo tee patch/kernel/star64-current/01-gpu-custom-resolutions.patch
git -C cache/sources/linux-star64/star64-5.15 diff arch/riscv/ | sudo tee patch/kernel/star64-current/02-arch-riscv.patch
