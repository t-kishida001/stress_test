#!/bin/bash

mem_size=$(free -m | awk 'NR==2{print $2}')

dd if=/dev/urandom of=/dev/shm/tempfile bs=2000M count=$mem_size

while true; do
	dd if=/dev/urandom of=/dev/shm/tempfile bs=1000M count=1 conv=notrunc
	sleep 1
done

# note
# remember: rm -rf /dev/shm/tempfile
