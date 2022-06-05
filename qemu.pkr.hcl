# This file was autogenerated by the 'packer hcl2_upgrade' command. We
# recommend double checking that everything is correct before going forward. We
# also recommend treating this file as disposable. The HCL2 blocks in this
# file can be moved to other files. For example, the variable blocks could be
# moved to their own 'variables.pkr.hcl' file, etc. Those files need to be
# suffixed with '.pkr.hcl' to be visible to Packer. To use multiple files at
# once they also need to be in the same folder. 'packer inspect folder/'
# will describe to you what is in that folder.

# Avoid mixing go templating calls ( for example ```{{ upper(`string`) }}``` )
# and HCL2 calls (for example '${ var.string_value_example }' ). They won't be
# executed together and the outcome will be unknown.

# All generated input variables will be of 'string' type as this is how Packer JSON
# views them; you can change their type later on. Read the variables type
# constraints documentation
# https://www.packer.io/docs/templates/hcl_templates/variables#type-constraints for more info.
variable "stage3" {
  type = string
  default = "20220522T170533Z"
}

variable "unprivileged_user" {
  type = string
  default = "gentoo"
}

variable "unprivileged_user_password" {
  type = string
  default = "Packer_123"
}

variable "kernel" {
  type    = string
  default = "gentoo-kernel-bin"
}

variable "password" {
  type    = string
  default = "Packer_123"
}

variable "username" {
  type    = string
  default = "root"
}

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
# could not parse template for following block: "template: hcl2_upgrade:2: bad character U+0060 '`'"

source "qemu" "gentoo-amd64" {
  accelerator       = "kvm"
  boot_command      = ["gentoo-nofb", "<enter>", "<wait10>", "<enter>", "<wait10>", "<wait10>", "<wait10>", "<wait10>", "<wait10>", "passwd ${var.username}", "<enter>", "<wait>", "${var.password}", "<enter>", "<wait>", "${var.password}", "<enter>", "<wait>", "/etc/init.d/sshd start", "<enter>", "<wait>"]
  boot_wait         = "10s"
  disk_interface    = "virtio"
  disk_size         = "10G"
  format            = "qcow2"
  headless          = "true"
  iso_checksum      = "sha512:48d3a8f510fe2d71d6c1a84db888bc1d11756f0110be7e437ceea15dd05ab787a8c32b47a90c775b5aecadcb5c75db0bf4a5bb652922974cfbb77881eb3f6dff"
  iso_url           = "https://mirror.yandex.ru/gentoo-distfiles/releases/amd64/autobuilds/${var.stage3}/install-amd64-minimal-${var.stage3}.iso"
  net_device        = "virtio-net"
  output_directory  = "stage3"
  qemuargs          = [["-display", "none"], ["-m", "2048M"], ["-smp", "cpus=2"]]
  shutdown_command  = "shutdown -hP now"
  ssh_password      = var.password
  ssh_timeout       = "20m"
  ssh_username      = var.username
  ssh_wait_timeout  = "20s"
  vm_name           = "gentoo-build-${var.stage3}"
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  description = "Faithful Stage 3 Gentoo Installation (VMWare)"

  sources = ["source.qemu.gentoo-amd64"]

  provisioner "file" {
    destination = "/tmp"
    source      = "scripts"
  }

  provisioner "shell" {
    environment_vars = ["STAGE3=${var.stage3}", "VM_TYPE=qemu", "SCRIPTS=/tmp", "GENTOO_MIRROR=https://mirror.yandex.ru/gentoo-distfiles/", "UNPRIVILEGED_USER=${var.unprivileged_user}", "UNPRIVILEGED_USER_PASSWORD=${var.unprivileged_user_password}", "GENTOO_KERNEL=${var.kernel}"]
    scripts          = ["provision.sh"]
  }
}
