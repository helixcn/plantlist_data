setwd("C:\\Jinlong\\github packages\\plantlist_data")
library(readxl)
library(openxlsx)
cnplants <- read_excel("plant_master_updated.xlsx")
genus_cn <- read_excel("genus_cn.xlsx")
family_cn <- read_excel("family_cn.xlsx")

head(cnplants)
head(genus_cn)
head(family_cn)

cnplants_genus_added <- merge(cnplants, genus_cn, by = "GENUS",  all.x = TRUE)

res <- merge(cnplants_genus_added, family_cn, by.x = "FAMILY_APGIII", by.y = "FAMILY", all.x = TRUE)

res2 <- subset(res, select = c("SPECIES_CN", "SPECIES", "SPECIES_FULL", "GENUS", "GENUS_CN", "FAMILY_APGIII", "FAMILY_CN", "GROUP", "IUCN_CHINA", "ENDEMIC_TO_CHINA", "PROVINTIAL_DISTRIBUTION", "ALTITUDE"))
res3 <- res2[order(res2$GROUP,res2$FAMILY_APGIII, res2$SPECIES),]

write.xlsx(res3, "plant_master_updated2.xlsx")

package.skeleton(name = "plantlist", list = ls())
