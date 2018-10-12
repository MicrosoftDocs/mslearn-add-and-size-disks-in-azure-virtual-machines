#!/bin/bash

sudo fdisk /dev/sdc <<EOF
n
p



p
w
EOF

sudo mkfs -t ext4 /dev/sdc1

sudo mkdir /uploads

sudo mount /dev/sdc1 /uploads

UUID=$(sudo -i blkid | grep '/dev/sdc1' | perl -pe 's/.+([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}).+/$1/')

echo "UUID=${UUID}    /uploads    ext4    defaults,nofail    1    2" | sudo tee --append /etc/fstab

sudo mount -a