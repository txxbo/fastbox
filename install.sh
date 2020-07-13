#!/bin/bash

boxname="hunter"
boxuser="txxbo"

function wait_for() {
    while :
    do
        eval $1
        case $? in
            (0) break ;;
            (*) echo -n "." ;;
        esac
        sleep 1
    done
}

echo "Creating new droplet [$boxname]"
python3 oceanic/oceanic.py -n $boxname
boxip=$(python3 oceanic/oceanic.py -i $boxname)
echo "Droplet ready [$boxip]"

echo -n "Waiting for SSH to come online"
wait_for "scp -o StrictHostKeyChecking=no root.sh root@$boxip:~/root.sh 2>/dev/null"
ssh root@$boxip "/root/root.sh $boxuser"

echo "Setup complete. You can now ssh into $boxuser@$boxip"