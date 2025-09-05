#!/bin/bash
# filepath: stop_servers.sh

read -p "Başlangıç VMID: " START
read -p "Bitiş VMID: " END

for (( VMID=START; VMID<=END; VMID++ )); do
    echo "Stopping VM $VMID"
    qm stop $VMID
done
