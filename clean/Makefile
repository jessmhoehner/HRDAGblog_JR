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

all: output/death1_cleaned.txt \
     output/death2_cleaned.txt

clean:
	rm output/*

output/death1_cleaned.txt: \
		src/clean.R \
		$(HERE)/import/output/death1_imported.txt
	Rscript --vanilla $<
		
output/death2_cleaned.txt: \
		src/clean.R \
		$(HERE)/import/output/death2_imported.txt
	Rscript --vanilla $<

# done.