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
p_load(dplyr,styler,tidyverse,forcats,readr,janitor,assertr)

files <- list(input1=here::here("clean/input/death_data_1_122219.txt"),
              input2=here::here("clean/input/death_data_2_122219.txt"),
              output1=here::here("clean/output/death1_clean.txt"),
              output2=here::here("clean/output/death2_clean.txt"))

stopifnot(is.list(files)== TRUE)

# why did we want these in rds files?

# set boundaries for date of interest 
dt_boundary_21 <- as.Date("2019-08-21")

death1 <- readr::read_delim(files$input1, delim="|") %>%
  clean_names() %>%
  mutate(age = as.integer(age)) %>%
  mutate(DOD = as.Date(`date`, "%Y/%m/%d")) %>%
  mutate(dateb_20190821 = ifelse(date < dt_boundary_21, "pre", "post"))  %>%
  mutate_at(vars(sex,status,dateb_20190821), as.factor) 

# retain only people with status "dead" and add in dates with no deaths
death1 <-
  filter(death1, status == "dead") %>%
  write_delim(files$output1, delim="|")
stopifnot(ncol(death1) == 7 & (nrow (death1) == 105)) 

death2 <- readr::read_delim(files$input2, delim="|") %>%
  clean_names() %>%
  mutate(age = as.integer(age)) %>%
  mutate(DOD = as.Date(`date`, "%Y/%m/%d")) %>%
  mutate(dateb_20190821 = ifelse(date < dt_boundary_21, "pre", "post"))  %>%
  mutate_at(vars(sex,status, dateb_20190821), as.factor)

#retain only people with status "dead" and add in dates with no deaths
death2 <-
  filter(death2, status == "dead") %>%
write_delim(files$output2, delim="|")
stopifnot(ncol(death2) == 7 & (nrow (death2) == 678))

#specify getmode function
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

######done####

