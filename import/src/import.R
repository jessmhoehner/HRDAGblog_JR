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
		 input1 = here("import/input/death1_import.txt"),
		 input2 = here("import/input/death2_import.txt"),
		 output1 = here("import/output/death1_imported.txt"),
		 output2 = here("import/output/death2_imported.txt"))
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
