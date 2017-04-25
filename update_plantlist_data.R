getScriptPath <- function(){
    cmd.args <- commandArgs()
    m <- regexpr("(?<=^--file=).+", cmd.args, perl=TRUE)
    script.dir <- dirname(regmatches(cmd.args, m))
    if(length(script.dir) == 0) stop("can't determine script dir: please call the script with Rscript")
    if(length(script.dir) > 1) stop("can't determine script dir: more than one '--file' argument detected")
    return(script.dir)
}

res <- getScriptPath()
setwd(res)
library(openxlsx)
rm(list = ls())
cnplants <- read.xlsx("plants_master.xlsx")
package.skeleton(name = "plantlist", list = ls())
