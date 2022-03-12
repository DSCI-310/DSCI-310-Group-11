library(testthat)

test_that("data_cleaning should report an error when a data frame is not inputed", {
  expect_error(data_cleaning(1,"people"))
  expect_error(data_cleaning("dataFrame", "gender"))
  expect_error(data_cleaning(FALSE, "num"))
})

test_that("data_cleaning should report an error when columns names are incorrect",{
  expect_error(data_cleaning(test_data, c("people","number")))
  expect_error(data_cleaning(test_data, c("PeoPLE")))
  expect_error(data_cleaning(test_data, c("")))
})

test_that("data_cleaning should output a data frame with only two columns (excluding people)", {
  expect_equivalent(data_cleaning(test_data, "people"), test_data_two_columns)
})

test_that("data_cleaning should output a dataFrame with only one columns (only gender)",{
  expect_equivalent(data_cleaning(test_data, c("people","num")), test_data_one_column)
})