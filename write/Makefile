# -*- coding: utf-8 -*-
#
# Author: PB
# Maintainer(s): PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
#HRDAGblog_JR/import/Makefile
# -----------------------------------------------------------
#
HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/HRDAGblogpost_JR.pdf

clean:
	rm output/*

output/HRDAGblogpost_JR.pdf: \
		src/blogpost.Rmd \
		$(HERE)/clean/output/fludata_1_122219.csv
	-rm src/HRDAGblogpost_JR.pdf src/blogpost.tex
	Rscript -e "rmarkdown::render('$<')"
	mv src/HRDAGblogpost_JR.pdf output/
	mv src/*png output/
	-rm src/blogpost.tex

# done.
