#!/bin/zsh

qemu-system-arm -kernel ~/raspi-vm/kernel-qemu-4.4.34-jessie \
-cpu arm1176 \
-m 256 \
-M versatilepb \
-serial stdio \
-append "root=/dev/sda2 rootfstype=ext4 rw console=ttyAMA0" \
-hda ~/raspi-vm/2017-04-10-raspbian-jessie.img \
-nic user,hostfwd=tcp::5022-:22 \
-no-reboot

