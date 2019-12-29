  
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

all: output/flu1.txt
	 output/flu2.txt

clean:
	rm output/*

output/flu1.txt: \
		src/import.R \
		input/flu_data_1_122219.txt
	Rscript --vanilla $<
	  /flu.txt \
	  src/import.R \
		input/flu_data_2_122219.txt
	Rscript --vanilla $<

# done.