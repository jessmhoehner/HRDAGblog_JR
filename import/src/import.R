#!/usr/bin/env Rscript --vanilla
# set expandtab ts=4 sw=4 ai fileencoding=utf-8
#
# Author: PB
# Maintainer(s): PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# -----------------------------------------------------------
#HRDAGblog_JR/import/src/import.R
#

require(pacman)
p_load(readr, readr, janitor, dplyr)
require(here)

#do we really need an output folder in the import task for this project?
#could we import the data in this task, call it from the clean task and output it in clean/output for use
#in the rest of the project?

getargs <- function() {
	list(
		 input1 = here("import/input/flu_data_1_122219.txt"),
		 output1 = here("import/output/flu1.txt"),
		 input2 = here("import/input/flu_data_2_122219.txt"),
		 output2 = here("import/output/flu2.txt"))
}

main <- function() {
    args <- getargs()
    read_tsv(args$input1) %>%
		clean_names() %>%
		write_delim(args$output1, delim="|")
    
    read_tsv(args$input2) %>%
      clean_names() %>%
      write_delim(args$output2, delim="|")
}


main()

# done.