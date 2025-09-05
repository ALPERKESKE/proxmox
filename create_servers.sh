#!/bin/bash
# filepath: set_vm_ips.sh

read -p "Başlangıç VMID: " START
read -p "Bitiş VMID: " END

while read -r VMID IP; do
    if (( VMID >= START && VMID <= END )); then
        echo "Setting IP $IP for VM $VMID"
        qm set $VMID --ipconfig0 ip=$IP/24,gw=192.168.178.1
    fi
done < servers.txt
