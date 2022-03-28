"This script creates fits the given model on the test set and produces the RMSE value.

Usage: /src/R/model_summary.R <model_recipe> <model_spec> <train_set> <test_set> <predictor>
" -> doc


library(tidyverse)
library(tidymodels)
library(docopt)

opt <- docopt(doc)

model_fit <- workflow() |>
  add_recipe(opt$model_recipe) |>
  add_model(opt$model_spec) |>
  fit(data = opt$train_set)

model_summary <- model_fit |>
  predict(opt$test_set) |>
  bind_cols(opt$test_set) |>
  metrics(truth = opt$predictor, estimate = .pred) |>
  filter(.metric == "rmse")

write_csv(model_summary, "results/model_rmse.csv")