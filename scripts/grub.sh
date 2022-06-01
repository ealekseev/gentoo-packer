#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -q ">=sys-boot/grub-2.0"
echo "set timeout=0" >> /etc/grub.d/40_custom
grub-install /dev/${DISK_PREFIX}a
grub-mkconfig -o /boot/grub/grub.cfg
EOF
