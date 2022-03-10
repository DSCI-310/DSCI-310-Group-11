library(testthat)
source("/Users/amy/Documents/DSCI-310-Group-11/src/R/recipe_scale_center.R")

test_that("`recipe_scale_center` should return a `tidymodels` recipe, 
          given a data frame and formula", {
  expect_s3_class(recipe_scale_center(one_predictor_df, one_predictor_formula),
                  recipe_type)
  expect_s3_class(recipe_scale_center(two_predictors_df, two_predictors_formula),
                  recipe_type)
  expect_s3_class(recipe_scale_center(three_predictors_df, three_predictors_formula),
                  recipe_type)
})

test_that("`recipe_scale_center` should throw an error if the `formula` argument
          is not formatted `target ~ predictor", {
  expect_error(recipe_scale_center(one_predictor_df, not_formula))
  expect_error(recipe_scale_center(two_predictors_df, not_formula))
  expect_error(recipe_scale_center(three_predictors_df, not_formula))
  expect_error(recipe_scale_center(two_predictors_df, one_predictor_df))
})

test_that("`recipe_scale_center` should throw an error if the `data` argument
          is not a data frame", {
  expect_error(recipe_scale_center(not_df, one_predictor_formula))
  expect_error(recipe_scale_center(not_df, two_predictors_formula))
  expect_error(recipe_scale_center(not_df, three_predictors_formula))
})

# test_that("`recipe_scale_center` ", {
#   # TODO: write tests
# })