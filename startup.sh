#!/bin/bash
cd /home/torhost
su -c "tmux new-session -d -s \"Tor session\" tor" torhost
/usr/sbin/sshd -D
