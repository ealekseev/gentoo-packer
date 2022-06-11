#!/bin/bash

emerge -q dev-lang/rust-bin app-emulation/cloud-init
#emerge -C dev-lang/rust-bin virtual/rust
rc-update add cloud-config
rc-update add cloud-init
rc-update add cloud-init-local
rc-update add cloud-final
