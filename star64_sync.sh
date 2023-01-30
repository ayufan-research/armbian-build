#!/bin/bash

set -x
rsync -av boot/{config,dtb,initrd.img,System.map,vmlinuz}-5.15.0-jh7110 root@starfive.home:/boot/boot/
rsync -av --delete lib/modules/5.15.0-jh7110/ root@starfive.home:/lib/modules/5.15.0-jh7110/
