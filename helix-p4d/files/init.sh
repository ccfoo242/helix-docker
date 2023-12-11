#!/bin/bash

# Setup directories
mkdir -p "$P4ROOT"
mkdir -p "$P4DEPOTS"
mkdir -p "$P4CKP"
mkdir -p "$P4DROOT/etc/perforce"

# Removed restore checkpoint section until I understand more
echo "Create empty or start existing server..."
setup.sh

p4 login <<EOF
$P4PASSWD
EOF

echo "Perforce Server starting..."
until p4 info -s 2> /dev/null; do sleep 1; done
echo "Perforce Server [RUNNING]"

## Remove all triggers
echo "Triggers:" | p4 triggers -i
