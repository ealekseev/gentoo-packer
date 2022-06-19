#!/bin/bash

if [ -z "$UNPRIVILEGED_USER" ]; then
  echo "Default user is not set. Skipping user creation."
else
  chroot /mnt/gentoo /tmp/chroot_scripts/create_user.sh
fi
