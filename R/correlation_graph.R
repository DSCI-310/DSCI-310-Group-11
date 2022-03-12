#' scatter2d 
#' A short-cut function for creating 2 dimensional ggpair scatterplots via GGally and ggplot2
#'
#' @param data A data frame or tibble.
#' @param title title of the plot from the data frame or tibble 
#'
#' @return returns a ggpairs scatterplot representing a correlation matrix between pairs of variables
#' @export
#'
#' @examples
#' scatter2d(mtcars, hp, mpg)

correlation_graph <- function (.data, gg_title) {
  GGally::ggpairs(data = .data, 
                  ggplot2::aes(colour = "steelblue", alpha = 0.5)) + 
    ggplot2::ggtitle(gg_title)



