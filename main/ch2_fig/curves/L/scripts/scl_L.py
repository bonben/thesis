#!/usr/bin/python3

import os
import sys
import math
import subprocess

# print('Number of arguments:', len(sys.argv), 'arguments.')
# print('Argument List:', str(sys.argv), "\n")

args  = sys.argv[1].split(" ") # cmd_line
L_min = int  (sys.argv[2])     # N_min
L_max = int  (sys.argv[3])     # N_max

args.append("-e")
args.append("1000000000")
args.append("--sim-stop-time")
args.append("30")
args.append("--term-freq"    )
args.append("0")
args.append("--sim-no-colors")
args.append("-L")
args.append("$L")

tab = "\t"

print("#N", tab, "K", tab, "L", tab, "Eb/N0", tab, "CTHR", tab, 'ITHR')

L_cur = L_min
while L_cur <= L_max:

	args[len(args) -1] = str(L_cur)

	process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	(stdout, stderr) = process.communicate()

	lines = stdout.decode('utf-8').split('\n')
	for line in lines:
		if len(line) and line[0] != '#' and line[0] != '(':
			line = line.replace("||", "|").replace(" ", "")
			cols = line.split("|")
			print(2048, tab, 1024	, tab, L_cur, tab, cols[1], tab, cols[7], tab, cols[8])

	L_cur = L_cur * 2