# -*- coding: utf-8 -*-
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
#HRDAGblog_JR/write/Makefile

HERE := $(shell git rev-parse --show-toplevel)

.PHONY: all clean

all: output/write.html

clean:
	rm output/*

output/write.html: \
		src/write.Rmd \
		$(HERE)/clean/output/deaths1.csv \
		$(HERE)/clean/output/deaths2.csv
	-rm src/write.html src/write.md
	Rscript -e "rmarkdown::render('$<')"
	mv src/*.html src/*.png output/
	-rm src/*.md

# done.
