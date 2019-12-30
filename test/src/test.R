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

files <- list(input1=here::here("clean/output/death1_clean.txt"),
              input2=here::here("clean/output/death2_clean.txt"),
              output1=here::here("test/output/death1_test.txt"),
              output2=here::here("test/output/death2_test.txt"))

stopifnot(is.list(files)== TRUE)

death1 <- readr::read_delim(files$input1, delim="|")
death2 <- readr::read_delim(files$input2, delim="|")

#set1
#mean number of deaths/day before 08 August 2019
counts1 <- count(death1, death1$DOD) #FIXME: add date component?
mucpd1 <- mean(counts1$n)

#max number of deaths/day
maxdeath1 <-max(counts1$n)

#set 2 
#mean number of deaths /day
counts2 <- count(death2, death2$DOD) #FIXME: add date component?
mucpd2 <- mean(counts2$n)

#max number of deaths/day
maxdeath2 <-max(counts2$n)

# need to add the variables to the dataframe and output that
