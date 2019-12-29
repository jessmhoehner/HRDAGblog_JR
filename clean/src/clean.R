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
require(here, assertr)

files <- list(input1=here::here("clean/input/flu_data_1_122219.txt"),
              input2=here::here("clean/input/flu_data_2_122219.txt"),
              output1=here::here("clean/output/flu1_clean.txt"),
              output2=here::here("clean/output/flu2_clean.txt"))
stopifnot(is.list(files)== TRUE)

#why did we want these in rds files?
#want to add in variables which are counts of the number of times each date occurs called cases/day here or do it just before graphing?

flu1 <- readr::read_delim(files$input1, delim="|") %>%
  clean_names() %>%
  mutate(age = as.integer(age)) %>%
  mutate(DOD = as.Date(`date`, "%m/%d/%Y")) %>%
  mutate_at(vars(DOD,sex,status), as.factor) %>%
write_delim(files$output1, delim="|", na= "NA")
stopifnot(ncol(flu1) == 6 & (nrow (flu1) == 108))

flu2 <- readr::read_delim(files$input2, delim="|") %>%
  clean_names() %>%
  mutate(age = as.integer(age)) %>%
  mutate(DOD = as.Date(`date`, "%m/%d/%Y")) %>%
  mutate_at(vars(DOD,sex,status), as.factor) %>%
write_delim(files$output2, delim="|", na= "NA")
stopifnot(ncol(flu2) == 6 & (nrow (flu2) == 974))


######done####