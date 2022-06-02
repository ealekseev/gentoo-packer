#!/bin/bash
echo UNPRIVILEGED_USER: ${UNPRIVILEGED_USER}
echo UNPRIVILEGED_USER_PASSWORD: ${UNPRIVILEGED_USER_PASSWORD}

USE="-sendmail" emerge -q app-admin/sudo net-fs/nfs-utils
useradd -m -s /bin/bash ${UNPRIVILEGED_USER}
echo ${UNPRIVILEGED_USER}:${UNPRIVILEGED_USER_PASSWORD} | chpasswd
echo "${UNPRIVILEGED_USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNPRIVILEGED_USER}
mkdir -p ~${UNPRIVILEGED_USER}/.ssh
chmod 0700 ~${UNPRIVILEGED_USER}/.ssh
chmod 0600 ~${UNPRIVILEGED_USER}/.ssh/authorized_keys
chown -R ${UNPRIVILEGED_USER}: ~${UNPRIVILEGED_USER}/.ssh
if [ ! -z "${UNPRIVILEGED_USER_SSH_KEY}"]; then
  echo "${UNPRIVILEGED_USER_SSH_KEY}" >> ~${UNPRIVILEGED_USER}/.ssh/authorized_keys
fi
rc-update add sshd default
