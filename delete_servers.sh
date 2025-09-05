#!/bin/bash
# filepath: delete_servers.sh

read -p "Başlangıç VMID: " START
read -p "Bitiş VMID: " END

for (( VMID=START; VMID<=END; VMID++ )); do
    echo "Deleting VM $VMID"
    qm destroy $VMID
done
