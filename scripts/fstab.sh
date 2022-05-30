#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cat > /etc/fstab <<'DATA'
# <fs>		<mount>	<type>	<opts>		<dump/pass>
/dev/${DISK_PREFIX}a1	/boot	ext2	noauto,noatime	1 2
/dev/${DISK_PREFIX}a4	/	ext4	noatime		0 1
/dev/${DISK_PREFIX}a3	none	swap	sw		0 0
DATA
EOF
