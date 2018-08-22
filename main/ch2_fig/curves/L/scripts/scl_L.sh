#!/bin/bash

L_MIN="2"
L_MAX="32"
SNR="2.5"

p="32"
algo="SCL"
D="SCL"



cmd_line="./bin/aff3ct --sim-type BFER --cde-type POLAR -m $SNR -M $SNR --src-type AZCW --chn-type AWGN_FAST --dec-simd INTRA --crc-type FAST --crc-poly 32-GZIP -t 1 --dec-polar-nodes {R0,R0L,R1,REP,REPL,SPC_4} -p $p --cde-fb-gen-method GA -N 2048 -K 1024"
echo -e "\n\n\"$algo L=$L CRC_{32} SPC_{4} p=$p\""
echo -e "# $cmd_line --dec-type $D"
./scl_L.py "$cmd_line --dec-type $D" $L_MIN $L_MAX 
