#!/bin/bash

SNR="2.5"
D="SCL"
p="32"



cmd_line="./bin/aff3ct --sim-type BFER --sim-cde-type POLAR -m $SNR -M $SNR --src-type AZCW  --chn-type AWGN --chn-implem FAST --dec-simd INTRA --crc-type FAST --crc-poly 32-GZIP -t 1 -p $p --enc-fb-gen-method GA --dec-type $D" 
./scl_thr_diff.py "$cmd_line" 

