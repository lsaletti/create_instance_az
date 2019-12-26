#!/bin/sh

START_TIME_PROCESS="$(date -u +%s)"

# Variables
RESOURCEGROUP=$resourcegroup
VMNAME=$vmname
USER=$user
PASSWORD=$password

## Check Status Virtual Machine
az login -u $user -p $password
az login -u $user -p $password & az vm get-instance-view --name $vmname --resource-group $resourcegroup  --query instanceView.statuses[1] --output table > log.log
LOG=$(cat log.log | awk '{print $4}'|  tr -d '[:space:]')
statusVM=$LOG
MESSAGE="Status VM: $statusVM"
echo "${MESSAGE}"

## Execute Condition
if [ "$statusVM" = "stopped" ]; then
    az login -u $user -p $password & az vm start --resource-group $resourcegroup --name $vmname
    MESSAGE="Start VM: $vmname"
    echo "${MESSAGE}"
elif [ "$statusVM" = "running" ]; then
    az login -u $user -p $password & az vm stop --resource-group $resourcegroup --name $vmname
    MESSAGE="Stop VM: $vmname"
    echo "${MESSAGE}"
else
    # az login -u $user -p $password & az group deployment create --name $vmname --resource-group $resourcegroup --template-file create_vm.json
    MESSAGE="Create VM: $vmname"
    echo "${MESSAGE}"
fi

END_TIME_PROCESSED="$(date -u +%s)"
ELAPSED_TIME=$(($END_TIME_PROCESSED - $START_TIME_PROCESS))
MESSAGE=" TOTAL TIME ${ELAPSED_TIME}"
echo "${MESSAGE}"
exit 0
