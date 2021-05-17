#!/bin/bash
rm -rf brotli combined10
mkdir -p brotli combined10
rm -f combined10.sh; parallel -j1 -N10 ./join_up_args {} '>>' combined10.sh ::: *.ucm; chmod +x combined10.sh && ./combined10.sh
ls combined10/*.tar | parallel brotli -Z -o brotli/{/}.b {}';' ls -alh brotli/{/}.b {}
parallel -j1 -N10 ./gen_filelist {} '>>' brotli/filelist.tsv ::: *.ucm
du -sh combined10 brotli
