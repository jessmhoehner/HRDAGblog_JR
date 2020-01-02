# -*- coding: utf-8 -*-
#
# Author: PB
# Maintainer(s): PB
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
		$(HERE)/clean/output/deathdata_1_122219.txt
		$(HERE)/clean/output/deathdata_2_122219.tx
	-rm src/HRDAGblogpost_JR.pdf src/write.tex
	Rscript -e "rmarkdown::render('$<')"
	mv src/HRDAGblogpost_JR.pdf output/
	mv src/*png output/
	-rm src/write.tex

# done.
