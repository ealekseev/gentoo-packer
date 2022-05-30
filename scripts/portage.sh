#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /var/db/repos/gentoo
emerge-webrsync -q
EOF
