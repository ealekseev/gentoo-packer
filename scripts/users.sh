#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
USE="-sendmail" emerge app-admin/sudo
emerge net-fs/nfs-utils
useradd -m -s /bin/bash ${UNPRIVILEGED_USER}
echo ${UNPRIVILEGED_USER}:${UNPRIVILEGED_USER_PASSWORD} | chpasswd
echo '${UNPRIVILEGED_USER} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/${UNPRIVILEGED_USER}
mkdir -p ~${UNPRIVILEGED_USER}/.ssh
chmod 0700 ~${UNPRIVILEGED_USER}/.ssh
chmod 0600 ~${UNPRIVILEGED_USER}/.ssh/authorized_keys
chown -R ${UNPRIVILEGED_USER}: ~${UNPRIVILEGED_USER}/.ssh
rc-update add sshd default
EOF
