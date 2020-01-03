# -*- coding: utf-8 -*-
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# HRDAGblog_JR/clean/Makefile
# -----------------------------------------------------------
#
HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/death1_clean.txt \
     output/death2_clean.txt

clean:
	rm output/*

output/death1_clean.txt: \
		src/clean.R \
		$(HERE)/import/death_data_1_122219.txt
	Rscript --vanilla $<
		
output/death2_clean.txt: \
		src/clean.R \
		$(HERE) import/death_data_2_122219.txt
	Rscript --vanilla $<

# done.