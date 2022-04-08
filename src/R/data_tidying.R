# author: Sam Zhang
# date: 2022-03-30

"This script reads a dataset from a csv file and performs
the neccessary data cleaning/tidying, then saves that file
locally as a csv file. This script takes two data file paths.

Usage: src/R/data_tidying.R <file_path> <out_dir>
" -> doc

suppressPackageStartupMessages({
  library(tidyverse)
  library(docopt)
})

opt <- docopt(doc)

# load data -------------------------------------------------------------------
data <- read_csv(opt$file_path, show_col_types = FALSE)

# remove columns from data ----------------------------------------------------
data <- select(data, -c("X", "Y", "month", "day"))

# save data -------------------------------------------------------------------
write_csv(data, paste0(opt$out_dir, "/cleaned_data.csv"))
