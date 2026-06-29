#!/bin/bash

sudo fdisk /dev/sdd <<EOF


n
p
1

+10M
t
8e
w
EOF

sudo fdisk /dev/sdf <<EOF


n
p
1

+2.5G
t
8e
w
EOF

sudo fdisk /dev/sde <<EOF


n
p
1

+2.5G
t
8e
w
EOF

