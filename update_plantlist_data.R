setwd("C:\\Jinlong\\github packages\\plantlist_data")
rm(list = ls())
unlink(x = "./plantlist", recursive = TRUE)
options(stringsAsFactors = FALSE)

syst <- Sys.info()[['sysname']]
if(syst == "Windows"){
    # Ensure that Chinese Characters could be displayed properly.
    suppressMessages(Sys.setlocale(category = "LC_ALL", locale ="Chinese"))
}

library(readxl)
library(openxlsx)
library(tidyverse)

cnplants <- read_excel("cnplants_dat.xlsx")
cnplants <- unique(cnplants)

genus_cn <- read_excel("genus_cn.xlsx")   # 中国植物属名
family_cn <- read_excel("family_cn.xlsx") # 中国植物科名
liu_cn_genus <- read_excel("GENUS_CN_LIU.xlsx") # 只有被子植物，在中国分部属的命名人，其他类群的命名人暂无
liu_cn_genus_sub <- select(liu_cn_genus, c("GENUS",  "GENUS_AUTHOR"))
genera_dat <- read.csv("genera_dat.csv", header = TRUE)
orders_dat <- read.csv("orders_dat.csv", header = TRUE)

head(cnplants)
head(genus_cn)
head(family_cn)
head(genera_dat)
head(orders_dat)

## 因为每次运行， 都会merge，每次都添加这四个列，因此每次merge之前， 要去掉
if(any(c("FAMILY_NUMBER", "ORDER", "GROUP", "GENUS_AUTHOR") %in% colnames(cnplants) )){
    cnplants2 <- cnplants[, !colnames(cnplants)  %in% c("FAMILY_NUMBER", "ORDER", "GROUP", "GENUS_AUTHOR")]
} else {
    cnplants2 <- cnplants
}

## Add "FAMILY_NUMBER", "ORDER", "GROUP"
res <- merge(cnplants2, orders_dat, by= "FAMILY", all.x = TRUE)

## add "GENUS_AUTHOR"
res <- merge(res, liu_cn_genus_sub, by = "GENUS", all.x = TRUE)
head(res)

res2 <- subset(res, 
    select =  c("SPECIES_CN",
                "SPECIES",
                "SPECIES_FULL",
                "GENUS",
                "GENUS_AUTHOR",
                "GENUS_CN",
                "FAMILY",
                "FAMILY_CN",
                "FAMILY_NUMBER",
                "ORDER",
                "GROUP",
                "IUCN_CHINA",
                "ENDEMIC_TO_CHINA",
                "PROVINTIAL_DISTRIBUTION",
                "ALTITUDE"))

cnplants_dat <- res2[order(res2$GROUP, res2$FAMILY_NUMBER, res2$SPECIES),]

cnplants_dat[is.na(cnplants_dat)] <- ""
cnplants_dat <- unique(cnplants_dat)

write.xlsx(cnplants_dat, "cnplants_dat_updated.xlsx")

package.skeleton(name = "plantlist", list = c("genera_dat", "orders_dat", "cnplants_dat"))
