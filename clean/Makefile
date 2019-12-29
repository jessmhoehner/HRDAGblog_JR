# -*- coding: utf-8 -*-
#
# Author: PB
# Maintainer(s): PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# HRDAGblog_JR/clean/Makefile
# -----------------------------------------------------------
#
HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/flu1.csv

clean:
	rm output/*

output/flu1.rds: \
		src/clean.R \
		$(HERE)/import/output/flu1.csv
	Rscript --vanilla $<
# I want to be able to clean both files using the same task, how di I did this?
# done.