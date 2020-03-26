# -*- coding: utf-8 -*-
#
# Author: PB, JR
# Maintainer(s): PB, JR
# License: (c) HRDAG 2019, GPL v2 or newer
#
#HRDAGblog_JR/test/Makefile
# -----------------------------------------------------------
#
HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/*

clean:
	rm output/*

output/counts1_pre.txt: \
		src/test.R \
		$(HERE)/import/death1_clean.txt
		$(HERE)/import/death2_clean.txt
	Rscript --vanilla $<
output/counts1_post.txt: \
		src/test.R \
		$(HERE)/import/death1_clean.txt
		$(HERE)/import/death2_clean.txt
	Rscript --vanilla $<
output/counts2_pre.txt: \
		src/test.R \
		$(HERE)/import/death1_clean.txt
		$(HERE)/import/death2_clean.txt
	Rscript --vanilla $<
output/counts2_post.txt: \
		src/test.R \
		$(HERE)/import/death1_clean.txt
		$(HERE)/import/death2_clean.txt
	Rscript --vanilla $<	

# done.
