######## Data source for the herblabel package ################
######## if any update is needed, edit the following files and regenerate the rda files.

setwd("C:\\Jinlong\\github packages\\plantlist_data")
library(openxlsx)
rm(list = ls())
cnplants <- read.xlsx("plants_master.xlsx")
package.skeleton(name = "plantlist", list = ls())
