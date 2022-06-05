#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cd /usr/src/linux && make clean
emerge -C sys-kernel/gentoo-sources
emerge --depclean
EOF

rm -rf /mnt/gentoo/usr/portage
rm -rf /mnt/gentoo/tmp/*
rm -rf /mnt/gentoo/var/log/*
rm -rf /mnt/gentoo/var/tmp/*

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -q sys-fs/zerofree
EOF

cp /mnt/gentoo/sbin/zerofree ./
chmod +x ./zerofree

mount -o remount,ro /mnt/gentoo
./zerofree /dev/${DISK_PREFIX}a2
