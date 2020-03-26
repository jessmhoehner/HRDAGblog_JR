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
p_load(dplyr, styler, tidyverse, forcats, readr, janitor, assertr)

files <- list(input1=here::here("import/output/deaths1.csv"),
              input2=here::here("import/output/deaths2.csv"),
              output1=here::here("clean/output/deaths2.csv"),
              output2=here::here("clean/output/deaths2.csv"))

stopifnot(is.list(files) == TRUE)

# set boundaries for date of interest
dt_boundary_21 <- as.Date("2019-08-21")

death1 <- readr::read_delim(files$input1, delim="|") %>%
  clean_names() %>%
  mutate(DOD = as.Date(`date`, "%Y/%m/%d")) %>%
  mutate(dateb_20190821 = ifelse(date < dt_boundary_21, "pre", "post"))  %>%
  mutate_at(vars(status, dateb_20190821), as.factor)

# retain only people with status "dead" and add in dates with no deaths
death1 <- filter(death1, status == "dead")

# unit tests
death1 %>%
  verify(ncol(death1) == 4 & (nrow(death1) == 105)) %>%
  verify(is.factor(status)) %>%
  write_delim(files$output1, delim="|")

death2 <- readr::read_delim(files$input2, delim="|") %>%
  clean_names() %>%
  mutate(DOD = as.Date(`date`, "%Y/%m/%d")) %>%
  mutate(dateb_20190821 = ifelse(date < dt_boundary_21, "pre", "post"))  %>%
  mutate_at(vars(status, dateb_20190821), as.factor)

# retain only people with status "dead" and add in dates with no deaths
death2 <- filter(death2, status == "dead")

# unit tests
death2 %>%
  verify(is.factor(status)) %>%
  verify(is.factor(dateb_20190821)) %>%
  write_delim(files$output2, delim="|")

######done####

