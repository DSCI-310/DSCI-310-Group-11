"This script creates a recipe using the given formula and data frame.

Usage: /src/R/recipe_scale_center.R <dataframe> <formula>
" -> doc

library(tidyverse)
library(dplyr)
library(recipes)
library(docopt)

opt <- docopt(doc)

tidy_data <- read.csv(opt$dataframe)

model_formula <- opt$formula

model_recipe <- recipe(tidy_data, model_formula) |>
  step_center(all_predictors()) |>
  step_scale(all_predictors())
