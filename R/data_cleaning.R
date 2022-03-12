#' Creates a new data frame with selected columns dropped from an old dataFrame
#'
#' @param data_frame A data frame or data frame extension (e.g. a tibble).
#' @param columns Name(s) of column(s) from the dataFrame 
#'
#' @return A new data frame with columns dropped from the old data frame
#'
#' @export
#'
#' @examples
#' data_cleaning(fire_data, c("X","Y","month"))
data_cleaning <- function(dataFrame, columns){
  if(!is.data.frame(dataFrame)){
    stop("DataFrame must be a data frame! Please try again.")
  }
  colNames = names(dataFrame)
  for(c in columns){
    if({c} %in% colNames){
      dataFrame = dataFrame |> select(-{c})
    }else{
      stop("Wrong column names! Please try again")
    }
  }
  return(dataFrame)
}             
