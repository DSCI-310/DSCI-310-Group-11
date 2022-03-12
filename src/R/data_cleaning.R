#' Creates a new data frame with selected columns dropped from the old data frame
#'
#' @param dataFrame A data frame or data frame extension (e.g. a tibble).
#' @param columns Name(s) of column(s) from the data frame.
#'
#' @return A new data frame with columns dropped from the old data frame
#'
#' @export
#'
#' @examples
#' data_cleaning(fire_data, c("X","Y","month"))
data_cleaning <- function(data_frame, columns) {
  if (!is.data.frame(data_frame)) {
    stop("data_frame must be a data frame! Please try again.")
  }
  
  col_names <- names(data_frame)
  
  for (c in columns) {
    if ({c} %in% col_names) {
      data_frame <- data_frame |> dplyr::select(-{c})
    } else {
      stop("Wrong column names! Please try again")
    }
  }
  return(data_frame)
}
