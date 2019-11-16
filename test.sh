#!/usr/bin/env bash
# dd if=/dev/urandom of=input.bin bs=64k count=1
python3 recv.py -p 6668 output.bin -l debug &
python3 testch.py -p 6668 -P 8003 -l info &
sleep 0.1
python3 send.py -p 8003 input.bin -l debug
cmp input.bin output.bin
