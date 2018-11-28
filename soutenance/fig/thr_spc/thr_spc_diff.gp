set macro

# set text font and size
set terminal pdf enhanced font 'Helvetica,11' size 4,2.65
set encoding utf8
set termoption dash

set tmargin 0.3
set bmargin 3.2

# start define plot styles ####################################################
# Palette URL:
# http://colorschemedesigner.com/#3K40zsOsOK-K-

black      = "#000000"
red_000    = "#F9B7B0"
red_025    = "#F97A6D"
red_050    = "#E62B17"
red_075    = "#8F463F"
red_100    = "#6D0D03"

blue_000   = "#A9BDE6"
blue_025   = "#7297E6"
blue_050   = "#1D4599"
blue_075   = "#2F3F60"
blue_100   = "#031A49"

green_000  = "#A6EBB5"
green_025  = "#67EB84"
green_050  = "#11AD34"
green_075  = "#2F6C3D"
green_100  = "#025214"

brown_000  = "#F9E0B0"
brown_025  = "#F9C96D"
brown_050  = "#E69F17"
brown_075  = "#8F743F"
brown_100  = "#6D4903"

grid_color = "#6a6a6a"
text_color = "#6a6a6a"

my_line_width = "2.00"
my_axis_width = "1.2"
my_ps = "0.90"

set pointsize @my_ps

# set the style for the set 1, 2, 3...

set style line  1 linetype  5 linecolor rgbcolor  red_000 linewidth @my_line_width
set style line  2 linetype  7 linecolor rgbcolor  red_050 linewidth @my_line_width
set style line  3 linetype  9 linecolor rgbcolor  red_100 linewidth @my_line_width
set style line  4 linetype  4 linecolor rgbcolor blue_000 linewidth @my_line_width
set style line  5 linetype  6 linecolor rgbcolor blue_050 linewidth @my_line_width
set style line  6 linetype  8 linecolor rgbcolor blue_100 linewidth @my_line_width
set style line  7 linetype  5 linecolor rgbcolor  red_000 linewidth @my_line_width
set style line  8 linetype  7 linecolor rgbcolor  red_100 linewidth @my_line_width
set style line  9 linetype  9 linecolor rgbcolor  red_100 linewidth @my_line_width
set style line 10 linetype  4 linecolor rgbcolor blue_000 linewidth @my_line_width
set style line 11 linetype  6 linecolor rgbcolor blue_050 linewidth @my_line_width
set style line 12 linetype  8 linecolor rgbcolor blue_100 linewidth @my_line_width

# this is to use the user-defined styles we just defined.
set style increment user

# set the color and width of the axis border
set border 31 lw @my_axis_width lc rgb text_color

# set key options
#set key outside;
set key right top;
set key top right width 2 height 0.5 font 'Helvetica, 11'
#set key box

# set grid color
set grid lc rgb grid_color

# end define plot styles ######################################################


set output "./thr_spc_diff.pdf"
datafile_thr = "./data_spc_diff.txt"
datafile_snr = "../snr/data_snr_diff.txt"


set multiplot layout 1,2

set logscale x 2
set format x '2^{%L}'
set xrange [128:8192]
set title "Comparison SPC4 and SPC4+ depending on frame size"

set key
set xlabel "Codeword size (N)"
set ylabel "SNR loss (dB)"
plot for [IDX=0:5] datafile_snr using 1:6 i IDX with linespoint title columnheader(1)

unset key
set xlabel "Codeword size (N)"
set ylabel "SPC Throughtput gain (%)"
plot for [IDX=0:5] datafile_thr using 1:9 i IDX with linespoint title columnheader(1)

unset multiplot
