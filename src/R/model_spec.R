"This script creates a knn regression model specification.

Usage: /src/R/model_spec.R <neighbours>

Use 'tune()' or a numerical value
" -> doc

library(tidyverse)
library(tidymodels)
library(docopt)

opt <- docopt(doc)

model_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = opt$neighbours) |>
  set_engine("kknn") |>
  set_mode("regression")
