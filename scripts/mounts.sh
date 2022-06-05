#!/bin/bash

cd /
mount -t proc proc /mnt/gentoo/proc
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
