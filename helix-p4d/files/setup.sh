#!/bin/bash

# When setting up app in truenas, add storage linking /your/dataset/etc/perforce to /etc/perforce

if ! p4dctl list 2>/dev/null | grep -q "$NAME"; then
    /opt/perforce/sbin/configure-helix-p4d.sh "$NAME" -n -p "$P4PORT" -r "$P4ROOT" -u "$P4USER" -P "${P4PASSWD}" --case "$P4CASE" --unicode
fi

p4 configure set $P4NAME#server.depot.root=$P4DEPOTS
p4 configure set $P4NAME#journalPrefix=$P4CKP/$JNL_PREFIX

p4dctl start -t p4d "$NAME"
