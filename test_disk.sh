#!/bin/bash

test_file="/tmp/test_file"
file_size="500M"

dd if=/dev/zero of=$test_file bs=$file_size count=1
dd if=/dev/urandom of=/tmp/random_data bs=10M count=100

while true; do
  cp $test_file $test_file.copy
  dd if=/tmp/random_data of=$test_file.copy bs=1M count=5000 conv=notrunc iflag=direct
  rm $test_file.copy
done

