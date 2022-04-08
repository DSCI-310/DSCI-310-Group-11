# author: Sam Zhang
# date: 2022-03-31

"This script splits a dataset into training/testing sets (75:25) and scales
the training set so that all variables are on a comparable scale

Usage: src/R/data_splitting.R <file_path> <out_dir>
" -> doc

suppressPackageStartupMessages({
  library(tidymodels)
  library(tidyverse)
  library(docopt)
  library(recipes)
})

set.seed(2022)

opt <- docopt(doc)

# load data -------------------------------------------------------------------
data <- read_csv(opt$file_path, show_col_types = FALSE)

# split data into training and testing sets -----------------------------------
fire_split <- initial_split(data, prop = 0.75, strata = area)
fire_train <- training(fire_split)
fire_test <- testing(fire_split)

# create a model recipe -------------------------------------------------------
fire_recipe <- recipe(area ~ ., data = fire_train) %>%
  step_center(all_predictors()) %>%
  step_scale(all_predictors())

# train and apply recipe to model ---------------------------------------------
fire_scaled <- fire_recipe %>%
  prep() %>%
  bake(fire_train)

# save data sets --------------------------------------------------------------
write_csv(fire_train, paste0(opt$out_dir, "/training_data.csv"))
write_csv(fire_test, paste0(opt$out_dir, "/testing_data.csv"))
write_csv(fire_scaled, paste0(opt$out_dir, "/scaled_and_centered_training_data.csv"))
