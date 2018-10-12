#!/bin/bash

sudo umount /dev/sdc1

sudo parted /dev/sdc <<EOF
resizepart
1
128GB
quit
EOF

sudo umount /dev/sdc1

sudo e2fsck -f /dev/sdc1

sudo resize2fs /dev/sdc1

sudo mount /dev/sdc1 /uploads