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
		 input = here("import/input/death1_import.txt"),
		 input = here("import/input/death2_import.txt"),
		 output = here("import/output/death1_imported.txt"),
		 output = here("import/output/death2_imported.txt"))
}


main <- function() {
    args <- getargs()
	read_excel(args$input, sheet="RAW DATA") %>%
		clean_names() %>%
		write_delim(args$output, delim="|")
}


main()

# done.