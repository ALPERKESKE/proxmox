#!/bin/bash
# filepath: set_vm_ips.sh

read -p "Başlangıç VMID: " START
read -p "Bitiş VMID: " END

for (( VMID=START; VMID<=END; VMID++ )); do
    read -p "VM $VMID için IP adresi: " IP
    echo "Setting IP $IP for VM $VMID"
    qm set $VMID --ipconfig0 ip=$IP/24,gw=192.168.178.1
done
