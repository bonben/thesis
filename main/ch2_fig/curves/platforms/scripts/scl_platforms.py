#!/usr/bin/python3


import os
import sys
import math
import subprocess
import itertools


idx = 0

N_K_list    = [
             # "-N 512  -K 171",
             # "-N 512  -K 256",
             # "-N 512  -K 341",
             # "-N 1024 -K 341",
             # "-N 1024 -K 512",
             # "-N 1024 -K 682",
             # "-N 2048 -K 682",
             # "-N 2048 -K 1024",
             # "-N 2048 -K 1365",
             "-N 2048 -K 1723",
            ]
N_K_idx  = idx
idx   += 1

L_list    = [
             "-L 8" ,
             "-L 16",
             "-L 32"
            ]
L_idx  = idx
idx   += 1

p_list    = [
             "-p 8",
             "-p 16",
             "-p 32"
            ]
p_idx  = idx
idx   += 1

SNR_list  = [
             "-m 3.5 -M 3.5",
             "-m 4.0 -M 4.0",
             "-m 4.5 -M 4.5"
            ]
SNR_idx  = idx
idx   += 1

algo_list = [
             "--dec-type SCL",
             "--dec-type ASCL",
             "--dec-type ASCL --dec-partial-adaptive"
            ]
algo_idx  = idx
idx   += 1

runs = []
# generate any combination
for combination in itertools.product(N_K_list, L_list, p_list, SNR_list, algo_list):
    runs.append(combination)


print(len(runs))

args_base = []

args_base.append("./bin/aff3ct"                  )
args_base.append("--sim-type"                    )
args_base.append("BFER"                          )
args_base.append("--sim-cde-type"                )
args_base.append("POLAR"                         )
args_base.append("--src-type"                    )
args_base.append("RAND"                          )
args_base.append("--src-implem FAST"             )
args_base.append("--chn-type"                    )
args_base.append("AWGN"                          )
args_base.append("--chn-implem"                  )
args_base.append("FAST"                          )
args_base.append("--dec-simd"                    )
args_base.append("INTRA"                         )
args_base.append("--crc-type"                    )
args_base.append("FAST"                          )
args_base.append("--crc-poly"                    )
args_base.append("32-GZIP"                       )
args_base.append("-t"                            )
args_base.append("1"                             )
args_base.append("--enc-fb-gen-method"           )
args_base.append("GA"                            )
args_base.append("-e"                            )
args_base.append("1000000"                       )
args_base.append("--sim-stop-time"               )
args_base.append("5"                             )
args_base.append("--sim-stats"                   )
args_base.append("--sim-no-colors"               )
args_base.append("--dec-polar-nodes"             )
args_base.append("\"{R0,R0L,R1,REP,REPL,SPC_4}\"")

for run in runs:
	
	args = args_base.copy()
	for var_args in run:
		for var_arg in var_args.split(" "):
			args.append(var_arg)

	process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	(stdout, stderr) = process.communicate()

	lines = stdout.decode('utf-8').split('\n')
	for line in lines:
		if "decode_siho" in line :
			line    = line.replace("||", "|").replace(" ", "")
			cols    = line.split("|")
			ithr    = cols[6]
			avg_lat = cols[9]
			max_lat = cols[11]
	run = list(run)
	run.append("thr "     + ithr + " Mb/s")
	run.append("avg_lat " + avg_lat + " us")
	run.append("max_lat " + max_lat + " us")
	print(run)
