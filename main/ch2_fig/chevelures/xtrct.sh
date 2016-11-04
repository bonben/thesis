#!/bin/zsh
sed -n 6,37p $1 > nn_f.dat  &&
sed -n 39,70p $1 > ii_f.dat &&
sed -n 72,103p $1 > ni_f.dat &&
sed -n 106,137p $1 > in_f.dat &&
sed -n 139,171p $1 > err_f.dat &&
sed -n 174,205p $1 > nn_c.dat &&
sed -n 207,238p $1 > ii_c.dat &&
sed -n 240,272p $1 > ni_c.dat &&
sed -n 274,305p $1 > in_c.dat &&
sed -n 307,339p $1 > err_c.dat

