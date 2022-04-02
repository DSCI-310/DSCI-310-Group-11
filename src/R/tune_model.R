"This scripts fits a k-nn regression model on the given data and get the minimum
number of neighbours for k-nn.
The model with best k value is saved as a csv file named 'best_k.csv'.

The training data is to be a csv file.

Usage: src/R/tune_fit.R <train_data> <out_dir>
" -> doc

library(tidyverse)
library(tidymodels)
library(docopt)
set.seed(2022)

opt <- docopt(doc)

# read training data ----------------------------------------------------------
train_set <- read.csv(opt$train_data)

# model tuning ----------------------------------------------------------------
# create recipe
model_recipe <- recipe(area ~ DC + DMC + ISI + FFMC + temp + RH, train_set)

# create model specification
model_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
  set_engine("kknn") %>%
  set_mode("regression")

# create workflow
model_wkflw <- workflow() %>%
  add_recipe(model_recipe) %>%
  add_model(model_spec)

# hyperparameter tuning -------------------------------------------------------

# perform 5 fold cross-validation
model_cv <- vfold_cv(train_set, v = 5, strata = area)

gridvals <- tibble(neighbors = seq(from = 1, to = 200, by = 3))

model_results <- model_wkflw %>%
  tune_grid(resamples = model_cv, grid = gridvals) %>%
  collect_metrics() %>%
  filter(.metric == "rmse")

# the minimum k
k_min <- model_results %>%
  filter(mean == min(mean))

# store k in a data frame to save
k_min_df <- data.frame(k_min)

k_min_table <- k_min_df %>%
  select(-n, -.config, - .estimator)

# save best model results as a .csv file --------------------------------------
write_csv(k_min_table, paste0(opt$out_dir, "/best_k.csv"))