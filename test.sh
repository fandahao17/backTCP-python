#!/usr/bin/env bash
# dd if=/dev/urandom of=input.bin bs=64k count=1
python3 recv.py -p 6668 output.bin &
python3 testch.py -p 6668 -P 8003 &
sleep 0.1
python3 send.py -p 8003 input.bin
cmp input.bin output.bin
