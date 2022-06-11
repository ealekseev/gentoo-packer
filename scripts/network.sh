#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -q net-misc/dhcpcd
ln -s /etc/init.d/net.lo /etc/init.d/net.eth0
echo 'config_eth0="dhcp"' >> /etc/conf.d/net
rc-update add net.eth0 default
EOF
# Enable serial console
sed -i '/ttyS0/s/^#//' /mnt/gentoo/etc/inittab
