#!/bin/bash

UUID=$(blkid /dev/${DISK_PREFIX}a2 -o value -s UUID)
echo "# <fs>    <mount> <type>  <opts>    <dump/pass>" > /etc/fstab
echo "UUID=${UUID} / ext4  noatime   0 1" >> /etc/fstab
