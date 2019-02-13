#!/bin/bash

# Unmount the disk /dev/sdc1.
sudo umount /dev/sdc1

# Resize partition 1 to be 128GB.
# Read from standard input provide the options we want.
sudo parted /dev/sdc <<EOF
resizepart
1
128GB
quit
EOF

# The partition tool automatically remounts the drive. 
# Unmount it again so we can format it.
sudo umount /dev/sdc1

# Verify partition consistency.
sudo e2fsck -f -p /dev/sdc1

# Resize the filesystem.
sudo resize2fs /dev/sdc1

# Mount the drive (/dev/sdc1) back to the mount point (/uploads).
sudo mount /dev/sdc1 /uploads
