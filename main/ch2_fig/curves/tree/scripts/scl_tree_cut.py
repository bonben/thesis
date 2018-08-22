#!/usr/bin/python3

import os
import sys
import math
import subprocess

# print('Number of arguments:', len(sys.argv), 'arguments.')
# print('Argument List:', str(sys.argv), "\n")

args = sys.argv[1].split(" ") # cmd_line
SNR  = sys.argv[2]            # SNR (E_b/N_0)
N    = sys.argv[3]            # N
T    = int(sys.argv[4])       # T (tics, number of intervals)

args.append("-e")
args.append("1000000000")
args.append("--sim-stop-time")
args.append("1")
args.append("--term-freq"    )
args.append("0")
args.append("--sim-no-colors")
args.append("-m")
args.append(SNR)
args.append("-M")
args.append(SNR)
args.append("-N")
args.append(N)
args.append("-K")
args.append("$K")
args.append("--dec-polar-nodes")
args.append("$tree_cut")

tree_cuts = []
tree_cuts.append("{}")
tree_cuts.append("{R0, R0L}")
tree_cuts.append("{R0, R0L, R1}")
tree_cuts.append("{R0, R0L, R1, REP, REPL}")
tree_cuts.append("{R0, R0L, R1, REP, REPL, SPC_4}")
tree_cuts.append("{R0, R0L, R1, REP, REPL, SPC_4+}")

tab = "\t"

legend = "# SNR" + tab + "N" + tab + "K" + tab + "R"
for tree_cut in tree_cuts:
	legend = legend + tab + "C_THR_" + tree_cut
print(legend)

t = 1
while t < T:
	K = str(round((float(N) / float(T)) * float(t)))
	args[len(args) -3] = K

	c_thrs = []
	for tree_cut in tree_cuts:
		args[len(args) -1] = tree_cut

		process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		(stdout, stderr) = process.communicate()

		lines = stdout.decode('utf-8').split('\n')
		for line in lines:
			if len(line) and line[0] != '#' and line[0] != '(':
				line  = line.replace("||", "|").replace(" ", "")
				cols  = line.split("|")
				c_thrs.append(float(cols[7]))

	line = SNR + tab + N + tab + K + tab + str(t) + "/" + str(T)
	for c_thr in c_thrs:
		line = line + tab + str(c_thr)
	print(line)


	t = t +1