# setup.R
# make sure any needed packages are loaded
# Jim Lutz  2023-03-22
# from "/home/jiml/library/standards/Japan/translate/setup.R"

# clean up leftovers before starting
# clear all the objects except fn_script(?)
l_obj=ls(all=TRUE)
l_obj = c(l_obj, "l_obj") # be sure to include l_obj
rm(list = l_obj[l_obj != "fn_script"])

# clear the plots
if(!is.null(dev.list())){
  dev.off(dev.list()["RStudioGD"])
}

# clear history
cat("", file = ".nohistory")
loadhistory(".nohistory")

# clear the console
cat("\014")

# install and attach files as needed
# work with tidyverse package
if(!require(tidyverse)){install.packages("tidyverse")}
library(tidyverse)

# work with data.table package
if(!require(data.table)){install.packages("data.table")}
library(data.table)

# work with httr package
if(!require(httr)){install.packages("httr")}
library(httr)

# work with jsonlite package
if(!require(jsonlite)){install.packages("jsonlite")}
library(jsonlite)

# work with logger package
if(!require(logger)){install.packages("logger")}
library(logger)

# work with lubridate package
if(!require(lubridate)){install.packages("lubridate")}
library(lubridate)

# work with writexl package
if(!require(writexl)){install.packages("writexl")}
library(writexl)

# work with readxl package
if(!require(readxl)){install.packages("readxl")}
library(readxl)
