# author: Sam Zhang
# date: 2022-03-31

"This script splits a dataset into training/testing sets (75:25) and scales
the training set so that all variables are on a comparable scale

Usage: /src/R/data_splitting.R <file_path> <destination_path1> <destination_path2> <destination_path3>
" -> doc

library(tidymodels)
library(tidyverse)
library(docopt)

set.seed(2022)

opt <- docopt(doc)

data <- read_csv(opt$file_path, show_col_types = FALSE)

fire_split <- initial_split(data, prop = 0.75, strata = area)
fire_train <- training(fire_split)
fire_test <- testing(fire_split)

fire_recipe <- recipes::recipe(area ~., data = fire_train) %>%
  recipes::step_center(recipes::all_predictors()) %>%
  recipes::step_scale(recipes::all_predictors())

fire_scaled <- fire_recipe %>%
  prep() %>%
  bake(fire_train)

write_csv(fire_train, opt$destination_path1)
write_csv(fire_test, opt$destination_path2)
write_csv(fire_scaled, opt$destination_path3)