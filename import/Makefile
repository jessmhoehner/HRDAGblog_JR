# -*- coding: utf-8 -*-
#
# Author: PB
# Maintainer(s): PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# CN-HK-suicides/import/Makefile
# -----------------------------------------------------------
#
.PHONY: all clean

all: output/flu_clean.csv

clean:
	src/clean_flu.R
	input/cides_flu.csv
Rscript --vanilla $<
	

output/fludata1.csv:\
		src/import.R \
		input/flu_data_1_122219.csv
	Rscript --vanilla $<
output/flu_clean2.csv:\
		src/import.R \
		input/flu_data_2_122219.csv
	Rscript --vanilla $<

# done.
