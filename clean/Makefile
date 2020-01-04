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

all: output/deaths1.csv \
     output/deaths2.csv

clean:
	rm output/*

output/deaths1.csv: \
		src/clean.R \
		$(HERE)/import/output/deaths1.csv
	Rscript --vanilla $<
		
output/deaths2.csv: \
		src/clean.R \
		$(HERE)/import/output/deaths2.csv
	Rscript --vanilla $<

# done.