#!/bin/bash

emerge -q ">=sys-boot/grub-2.0"
echo "set timeout=0" >> /etc/grub.d/40_custom
grub-install /dev/${DISK_PREFIX}a
sed -i '/^#GRUB_CMDLINE_LINUX=/s/^#//' /etc/default/grub
sed -i '/^GRUB_CMDLINE_LINUX/s/"$/ net.ifnames=0"/' /etc/default/grub
sed -i '/^GRUB_CMDLINE_LINUX/s/"$/ console=ttyS0"/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
