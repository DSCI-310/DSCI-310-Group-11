# author: Sam Zhang
# date: 2022-03-30

"This script reads a dataset from the data source URL and saves it
locally as a csv file called forestfires.csv in the provided directory.

Usage: src/R/data_loading.R <url> <out_dir>
" -> doc

suppressPackageStartupMessages({
  library(tidyverse)
  library(docopt)
})

opt <- docopt(doc)

# load data -------------------------------------------------------------------
data <- read_csv(opt$url, show_col_types = FALSE)

# save data -------------------------------------------------------------------
write_csv(data, paste0(opt$out_dir, "/forestfires.csv"))
