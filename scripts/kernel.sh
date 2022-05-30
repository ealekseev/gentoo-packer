#!/bin/bash

cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/

chroot /mnt/gentoo /bin/bash <<'EOF'
echo "sys-kernel/linux-firmware linux-fw-redistributable no-source-code" >> /etc/portage/package.license
emerge -q sys-kernel/gentoo-sources
emerge -q sys-kernel/genkernel
cd /usr/src/linux
mv /tmp/kernel.config .config
genkernel --install --symlink --no-zfs --no-btrfs --oldconfig all
emerge -q -c sys-kernel/genkernel
EOF
