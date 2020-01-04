# -*- coding: utf-8 -*-
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# HRDAGblog_JR/import/Makefile
# -----------------------------------------------------------
#
HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/death1_imported.txt \
	 output/death2_imported.txt

clean:
	rm output/*

output/death1_imported.txt: \
		src/import.R \
		$(HERE)/import/input/death1_import.txt
	Rscript --vanilla $<

output/death2_imported.txt: \
		src/import.R \
		$(HERE)/import/input/death2_import.txt
	Rscript --vanilla $<

# done.