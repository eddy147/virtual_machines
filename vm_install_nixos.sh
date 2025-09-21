#! /bin/bash

virt-install \
  --connect qemu:///system \
  --name nixos \
  --memory 8192 \
  --disk size=100 \
  --disk path=/home/eddy/VirtualMachines/nixos.qcow2,format=qcow2,bus=virtio,size=100 \
  --cdrom /home/eddy/Downloads/nixos-graphical-25.05.809980.e9b7f2ff62b3-x86_64-linux.iso
