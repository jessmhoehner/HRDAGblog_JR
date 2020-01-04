#!/usr/bin/env Rscript --vanilla
# set expandtab ts=4 sw=4 ai fileencoding=utf-8
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# -----------------------------------------------------------
# HRDAGblog_JR/import/src/import.R
#

require(pacman)
p_load(readxl, readr, janitor, dplyr)
require(here)


getargs <- function() {
	list(
		 input1 = here("import/input/deaths1.csv"),
		 input2 = here("import/input/deaths2.csv"),
		 output1 = here("import/output/deaths1.csv"),
		 output2 = here("import/output/deaths2.csv"))
}


main <- function() {
    args <- getargs()
	read_delim(args$input1, delim= "|") %>%
		clean_names() %>%
		write_delim(args$output1, delim="|")
	read_delim(args$input2, delim= "|") %>%
	  clean_names() %>%
	  write_delim(args$output2, delim="|")
}


main()

# done.
