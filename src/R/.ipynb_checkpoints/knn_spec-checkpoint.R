#' A model specification for k-nearest neighbours
#'
#' Create a k-nearest neighbour regression model specification, with the given
#' neighbours, using rectangular kernel function to weight distances between
#' samples.
#'
#' @param neighbours A positive integer value
#'
#' @return A k-nearest neighbour model specification, stating the arguments used:
#' neighbours and weight_func and the computational engine.
#'
#' @export
#'
#' @examples
#' knn_spec(5)
knn_spec <- function(neighbours) {
  if (!is.numeric(neighbours)) {
    stop("`knn_spec` expects a numeric value for the number of neighbours.")
  }
  
  if (!(neighbours %% 1 == 0) || neighbours < 0) {
    stop("`knn_spec` expects an positive, integer value for the number of neighbours.")
  }
  
  if (neighbours != "tune()") {
    stop("`knn_spec` expects a positive integer for the number of neighbours.")
  }
  
  parsnip::nearest_neighbor(neighbors = neighbours, weight_func = "rectangular") %>%
    parsnip::set_engine("kknn") %>%
    parsnip::set_mode("regression")
}
