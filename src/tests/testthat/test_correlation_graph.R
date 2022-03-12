library(vdiffr)
library(testthat)
source("../../../src/R/correlation_graph.R")

correlation_graph_matrix <- correlation_graph(mtcars[1:3, 1:3], "Correlation Matrix Between Pairs of Variables with Large Correlation Values")

test_that("refactoring the code should not change the plot", {
  expect_doppelganger("Correlation Matrix between Pairs of Variables",
                      correlation_graph_matrix)
})