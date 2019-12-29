# -*- coding: utf-8 -*-
#
# Author: PB
# Maintainer(s): PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# HRDAGblog_JR/import/Makefile
# -----------------------------------------------------------
#
.PHONY: all clean

#in this case could we just take the files from the import task,clean them, output them, and then call them from clean/output
#for the graphing and poisson tasks later on?
all: output/flu1.csv

clean:
	src/clean.R
	input/flu1.csv
	input/flu2.csv
Rscript --vanilla $<
	
#here I tried to see if this is how to add two files to this part of the task
output/flu1.csv:\
		src/import.R \
		input/flu_data_1_122219.csv
	Rscript --vanilla $<
output/flu2.csv:\
		src/import.R \
		input/flu_data_2_122219.csv
	Rscript --vanilla $<

# done.
