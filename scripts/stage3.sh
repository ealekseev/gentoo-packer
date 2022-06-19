#!/bin/bash

tarball=stage3-amd64-nomultilib-openrc-${STAGE3}.tar.xz

mount /dev/${DISK_PREFIX}a2 /mnt/gentoo

cd /mnt/gentoo
wget ${GENTOO_MIRROR}/releases/amd64/autobuilds/${STAGE3}/${tarball}
tar xJpf ${tarball}
rm -f ${tarball}
