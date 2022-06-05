#!/bin/bash

parted -s /dev/${DISK_PREFIX}a "mklabel gpt"
parted -s /dev/${DISK_PREFIX}a "mkpart primary 2048s 4095s"
parted -s /dev/${DISK_PREFIX}a "set 1 bios_grub on"
parted -s -a optimal /dev/${DISK_PREFIX}a "mkpart primary ext4 4096s 100%"
sync
mkfs.ext4 /dev/${DISK_PREFIX}a2
