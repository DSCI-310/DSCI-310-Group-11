library(testthat)
source("../../../src/R/knn_spec.R")

test_that("`knn_spec` should return a k-nearest neighbours model specification.", {
  expect_s3_class(knn_spec(0), "model_spec")
  expect_s3_class(knn_spec(5), "model_spec")
  expect_s3_class(knn_spec(900), "model_spec")
  expect_s3_class(knn_spec(df_element), "model_spec")
})

test_that("`knn_spec` should throw an error when incorrect types are passed in.", {
  expect_error(knn_spec(string_arg))
  expect_error(knn_spec(numeric_string))
  expect_error(knn_spec(list_arg))
  expect_error(knn_spec(df))
})

test_that("`knn_spec` should throw an error when a whole, positive number is
          not given.", {
  expect_error(knn_spec(decimal_num))
  expect_error(knn_spec(neg_dec_num))
  expect_error(knn_spec(neg_int))
})
