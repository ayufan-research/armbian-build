#!/bin/bash

IMAGE=$(ls -1 output/images/Armbian_23.02.0-trunk_Star64_*.img | tail -n1)

set -x

sudo --preserve-env=SSH_AUTH_SOCK bash -c "$(cat <<EOF
mount -o offset=$((8192*512)) "$IMAGE" /mnt/test
trap 'cd /; umount /mnt/test' EXIT
cd /mnt/test
bash -i
EOF
)"
