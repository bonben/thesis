#!/usr/bin/python3

import os
import sys
import math
import subprocess

#                                      N
#           L  R    256    512    1024   2048   4096   8192
# snr  = [
#            [8 ,0.33,"0.15","0.02","0.03","0.06","0.02","0.03"],
#            [8 ,0.50,"0.09","0.05","0.04","0.03","0.07","0.07"],
#            [8 ,0.66,"0.03","0.01","0.04","0.07","0.09","0.07"],
#            [32,0.33,"0.52","0.20","0.19","0.29","0.22","0.22"],
#            [32,0.50,"0.30","0.27","0.24","0.24","0.26","0.20"],
#            [32,0.66,"0.27","0.15","0.22","0.24","0.25","0.14"]
#        ]

#           L   R    256    1024  4096
snr  = [
           [8 ,0.33,"0.15","0.03","0.02"],
           [8 ,0.50,"0.09","0.04","0.07"],
           [8 ,0.66,"0.03","0.04","0.09"],
           [16 ,0.33,"0.03","0.04","0.09"],
           [16 ,0.50,"0.03","0.04","0.09"],
           [16 ,0.66,"0.03","0.04","0.09"],
           [32,0.33,"0.52","0.19","0.22"],
           [32,0.50,"0.30","0.24","0.26"],
           [32,0.66,"0.27","0.22","0.25"]
       ]


Rkey    = [
              "1/3",
              "1/2",
              "2/3",
    	      "1/3",
              "1/2",
              "2/3",
              "1/3",
              "1/2",
              "2/3"
          ]


args = sys.argv[1].split(" ")
args.append("--sim-stats")
args.append("-e")
args.append("1000000000")
args.append("--sim-stop-time")
args.append("30")
args.append("--sim-no-colors")
args.append("-L")
args.append("$L")
args.append("-N")
args.append("$N")
args.append("-K")
args.append("$K")
args.append("--dec-polar-nodes")
args.append("$DCP")

N_min = 256
N_max = 4096



for i in range (0,9):
	L     = snr[i][0]
	R     = snr[i][1]
	args[len(args) -7] = str(L)

	diff_array = [0,0,0,0,0,0,0,0,0]
	N_cur   = N_min
	N_index = 0

	while N_cur <= N_max:
		K_cur = int(N_cur * R)

		print("N = " + str(N_cur) + ", R = " + str(R) + ", L = " + str(L))

		args[len(args) -5] = str(N_cur)
		args[len(args) -3] = str(K_cur)
		args[len(args) -1] = "{R0,R0L,R1,REP,REPL,SPC_4}"

		# display command line
		# for arg in args:
		# 	print(arg, end=' ')
		# print()

		process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		(stdout, stderr) = process.communicate()

		lines = stdout.decode('utf-8').split('\n')

		for line in lines:
			if "decode_siho" in line :
				line = line.replace("||", "|").replace(" ", "")
				cols = line.split("|")
				cthr_spc4 = cols[6]

		args[len(args) -1] = "{R0,R0L,R1,REP,REPL,SPC}"


		process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		(stdout, stderr) = process.communicate()

		lines = stdout.decode('utf-8').split('\n')
		for line in lines:
			if "decode_siho" in line :
				line = line.replace("||", "|").replace(" ", "")
				cols = line.split("|")
				cthr_spc = cols[6]

		diff = (float(cthr_spc) - float(cthr_spc4)) / float(cthr_spc4)
		diff = round(100 * diff,1)
		
		# print("CTHR SPC4: " + str(cthr_spc4) + ", CTHR SPC4+: " + str(cthr_spc) + ", DIFF %: " + str(diff))
		print("DIFF %: " + str(diff))

		diff_array[N_index] = diff
		N_index = N_index + 1
		N_cur = N_cur * 4

