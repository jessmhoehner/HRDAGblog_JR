# -*- coding: utf-8 -*-
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
#HRDAGblog_JR/write/Makefile

HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/HRDAGblogpost_JR.pdf

clean:
	rm output/*

output/HRDAGblogpost_JR.pdf: \
		src/write.Rmd \
		$(HERE)/clean/output/death1_clean.txt \
		$(HERE)/clean/output/death2_clean.txt
	-rm src/HRDAGblogpost_JR.pdf src/write.tex
	Rscript -e "rmarkdown::render('$<')"
	mv src/*.pdf src/*.png output/
	-rm src/*.tex

# done.
