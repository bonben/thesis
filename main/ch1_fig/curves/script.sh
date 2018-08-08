#!/bin/bash

aff3ct_path=~/Projects/aff3ct

# SC Rendement 0.5 N varie
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 64    -N "128"   --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (128,64)      SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_128.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 128   -N "256"   --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (256,128)     SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_256.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 256   -N "512"   --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (512,256)     SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_512.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 512   -N "1024"  --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (1024,512)    SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_1024.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 1024  -N "2048"  --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,1024)   SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_2048.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 2048  -N "4096"  --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (4096,2048)   SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_4096.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 4096  -N "8192"  --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (8192,4096)   SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_8192.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 8192  -N "16384" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (16384,8192)  SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_16384.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 16384 -N "32768" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (32768,16384) SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_N/dat/SC_32768.txt


# SC N 2048 Rendement varie 1/8 1/4 3/8 etc...
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 256  -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,256)      SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_1_8.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 512  -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,512)      SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_2_8.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 768  -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,768)      SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_3_8.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 1024 -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,1024)     SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_4_8.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 1280 -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,1280)     SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_5_8.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 1536 -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,1536)     SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_6_8.txt
${aff3ct_path}/build/bin/aff3ct  --sim-type "BFER" -C "POLAR" -m "0" -M "6" -s "0.25" -e "100" --enc-fb-gen-method "GA"  -K 1792 -N "2048" --dec-type "SC" --dec-implem FAST  --sim-pyber "Polar (2048,1792)     SC" --dec-simd INTER --sim-stop-time 180 --chn-implem FAST --src-type RAND_FAST > sc_R/dat/SC_7_8.txt


