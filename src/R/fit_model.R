"This scripts fits a k-nn regression model on the training data and tests it
with the testing data to evaluate the model's performance using RMSE.
The RMSE value is saved as a csv file named 'testing_rmse.csv'

The training data, testing data, and best k value are to be csv files.

Usage: src/R/fit_model.R <train_data> <test_data> <best_k> <out_dir>
" -> doc

library(tidyverse)
library(tidymodels)
library(docopt)
set.seed(2022)

opt <- docopt(doc)

# read training and testing data ----------------------------------------------
train_set <- read.csv(opt$train_data)
test_set <- read.csv(opt$test_data)

# get minimum k value for k-nn ------------------------------------------------
best_k <- read.csv(opt$best_k)

# fit model -------------------------------------------------------------------
# create recipe
model_recipe <- recipe(area ~ DC + DMC + ISI + FFMC + temp + RH, train_set)

# create model specification
model_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = best_k) %>%
  set_engine("kknn") %>%
  set_mode("regression")

model_fit <- workflow() %>%
  add_recipe(model_recipe) %>%
  add_model(model_spec) %>%
  fit(data = train_set)

model_summary <- model_fit %>%
  predict(test_set) %>%
  bind_cols(test_set) %>%
  metrics(truth = area, estimate = .pred) %>%
  filter(.metric == "rmse")

write_csv(model_summary, paste0(opt$out_dir, "/testing_rmse.csv"))