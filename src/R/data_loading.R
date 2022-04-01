# author: Sam Zhang
# date: 2022-03-30

"This script reads a dataset from a csv file and saves it 
locally as a csv file. This script takes two data file paths.

Usage: /src/R/data_reading.R <file_path> <destination_path>
" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

data <- read_csv(opt$file_path, show_col_types = FALSE)
write_csv(data, opt$destination_path)