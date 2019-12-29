  
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

all: output/flu1_clean.txt
	 output/flu2_clean.txt

clean:
	rm output/*

output/flu1_clean.txt: \
		src/import.R \
		input/flu_data_1_122219.txt
	Rscript --vanilla $<
	  /flu_2clean.txt \
	  src/import.R \
		input/flu_data_2_122219.txt
	Rscript --vanilla $<

# done.