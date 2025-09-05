#!/bin/bash
# filepath: create_servers.sh

TEMPLATE_ID=9000
VM_ID_START=100

while read -r NAME IP CORE DISKSIZE BRIDGE MEMORY; do
    VM_ID=$((VM_ID_START++))
    echo "Creating $NAME with VMID $VM_ID, IP $IP, $CORE cores, $DISKSIZE disk, bridge $BRIDGE, $MEMORY MB RAM"

    qm clone $TEMPLATE_ID $VM_ID --name $NAME

    qm set $VM_ID \
        --cores $CORE \
        --memory $MEMORY \
        --net0 virtio,bridge=$BRIDGE \
        --ide0 local-lvm:$DISKSIZE \
        --ipconfig0 ip=$IP/24,gw=192.168.178.1

    qm start $VM_ID
done < servers.txt
