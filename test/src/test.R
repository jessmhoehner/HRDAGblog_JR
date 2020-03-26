#!/usr/bin/env Rscript --vanilla
# set expandtab ft=R ts=4 sw=4 ai fileencoding=utf-8
#
# Author: JR
# Maintainer(s): JR, PB
# License: (c) HRDAG 2019, GPL v2 or newer
#
# -----------------------------------------------------------
# HRDAGblog_JR/test/src/test.R
#
require(pacman)
p_load(dplyr,styler,tidyverse,readr,assertr)

files <- list(input1 = here::here("clean/output/death1_cleaned.txt"),
              input2 = here::here("clean/output/death2_cleaned.txt"),
              output1 = here::here("test/output/counts1_pre.txt"),
              output2 = here::here("test/output/counts1_post.txt"),
              output3 = here::here ("test/output/counts2_pre.txt"),
              output4 = here::here ("test/output/counts2_post.txt"))

stopifnot(is.list(files)== TRUE)

death1 <- readr::read_delim(files$input1, delim="|")

death2 <- readr::read_delim(files$input2, delim="|")

# set1
# before 21 August 2019
counts1_pre <- count(death1, dateb_20190821, DOD) %>%
  filter (dateb_20190821 == "pre") %>%
  complete(DOD = seq.Date(min(DOD), max(DOD), by="day"))

# set NAs to 0 
counts1_pre$n <- ifelse(is.na(counts1_pre$n), 0, counts1_pre$n) 

counts1_pre %>%
verify(ncol(counts1_pre) == 3) %>%
verify(not_na(counts1_pre$n)) %>%
  write_delim(files$output1, delim="|")

# after 21 August 2019 
counts1_post <- count(death1, dateb_20190821, DOD) %>%
  filter (dateb_20190821 == "post") %>%
  complete(DOD = seq.Date(min(DOD), max(DOD), by="day"))

# set NAs to 0 
counts1_post$n <- ifelse(is.na(counts1_post$n), 0, counts1_post$n) 

# export
counts1_post %>%
  verify(ncol(counts1_post) == 3) %>%
  verify(not_na(counts1_post$n)) %>%
  write_delim(files$output2, delim="|")

# set 2 
# before 21 August 2019
counts2_pre <- count(death2, dateb_20190821, DOD) %>%
  filter (dateb_20190821 == "pre") %>% 
  complete(DOD = seq.Date(min(DOD), max(DOD), by="day"))

# set NAs to 0 
counts2_pre$n <- ifelse(is.na(counts2_pre$n), 0, counts2_pre$n) 

# export
counts2_pre %>%
  verify(ncol(counts2_pre) == 3) %>%
  verify(not_na(counts2_pre$n)) %>%
  write_delim(files$output3, delim="|")

# after 21 August 2019 
counts2_post <- count(death2, dateb_20190821, DOD) %>%
  filter (dateb_20190821 == "post") %>%
  complete(DOD = seq.Date(min(DOD), max(DOD), by="day"))

# set NAs to 0 
counts2_post$n <- ifelse(is.na(counts2_post$n), 0, counts2_post$n) 

# export 
counts2_post %>%
  verify(ncol(counts2_post) == 3) %>%
  verify(not_na(counts2_post$n)) %>%
  write_delim(files$output4, delim="|")

###done###