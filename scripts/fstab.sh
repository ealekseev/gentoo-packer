#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cat > /etc/fstab <<"DATA"
# <fs>		<mount>	<type>	<opts>		<dump/pass>
/dev/${DISK_PREFIX}a2	/	ext4	noatime		0 1
DATA
EOF
