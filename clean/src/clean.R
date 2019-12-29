#!/usr/bin/env Rscript --vanilla
# set expandtab ft=R ts=4 sw=4 ai fileencoding=utf-8
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# -----------------------------------------------------------
# HRDAGblog_JR/clean/src/clean.R
#
require(pacman)
p_load(dplyr,styler,tidyverse,forcats,readr,janitor)
require(here)


files <- list(input=here::here("import/input/flu_data_1_122219.csv"),
			  input2=here::here("import/input/flu_data_2_122219.rds"),
              output=here::here("clean/output/flu1.csv"),
			  output2=here::here("clean/output/flu2.rds"))
stopifnot(is.list(files)== TRUE)

#how could we perform the same tasks on both data sets if we did want to keep
#them seperate? or would this be an argument in favor of merging them?

# exercises for JR:
#   -- upgrade repeated type converstions to mutate_at
#   -- recreate tests using assertr in the tidyr pipeline

#do we want to keep in the specific questions around cases happening before and after
#certain dates or to certain age groups or at certain times of day?

brks <- (1:9)*10
dt_boundary_01 <- as.Date("2019-08-01")
dt_boundary_21 <- as.Date("2019-08-21")

flu1 <- readr::read_delim(files$input, delim="|") %>%
	mutate(date = as.Date(`date`)) %>%
    mutate(DOD = as_factor(date),
           TOD = as_factor(time),
           status = as_factor(status),
		   sex = as_factor(sex)) %>%
    mutate(age = as.numeric(age)) %>%
	mutate(age_cut = cut(age,
                         breaks=brks,
                         right = FALSE)) %>%
    mutate(age_grp = as_factor(age_cut)) %>%
	mutate(dateb_20190801 = ifelse(date < dt_boundary_01, "pre", "post"),
		   dateb_20190821 = ifelse(date < dt_boundary_21, "pre", "post")) %>%
    select(-age_cut) %>%
	assert(ncol(.) == 14) %>%
	# i expect to have 3 rows with age_grp missing 
	#bc 3 people have age data missing
	verify(num_rows_na(age_grp)== 3) %>%
	verify(not_na(DOD, TOD, living_conditions,
				  dateb_20190821, dateb20190801)) %>%
    write_delim(files$output, delim="|")
stopifnot(nrow(flu1) == 109) #break it first, 107 breaks it

flu2 <- readr::read_delim(files$input2, delim="|") %>%
	mutate(date = as.Date(`date`)) %>%
    mutate(DOD = as_factor(date),
           TOD = as_factor(time),
           status = as_factor(status),
		   sex = as_factor(sex)) %>%
    mutate(age = as.numeric(age)) %>%
	mutate(age_cut = cut(age,
                         breaks=brks,
                         right = FALSE)) %>%
    mutate(age_grp = as_factor(age_cut)) %>%
	mutate(dateb_20190801 = ifelse(date < dt_boundary_01, "pre", "post"),
		   dateb_20190821 = ifelse(date < dt_boundary_21, "pre", "post")) %>%
    select(-age_cut) %>%
	assert(ncol(.) == 14) %>%
	# i expect to have 3 rows with age_grp missing 
	#bc 3 people have age data missing
	verify(num_rows_na(age_grp)== 3) %>%
	verify(not_na(DOD, TOD, living_conditions,
				  dateb_20190821, dateb20190801)) %>%
    write_delim(files$output2, delim="|")
	
flu2 <- readr::read_delim(files$cleanflu2, delim=",")
stopifnot(nrow(flu1) == 975) #break it first, 900 breaks it

######done####