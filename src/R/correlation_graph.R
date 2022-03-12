#' Create a ggpair scatter plot
#' 
#' A short-cut function for creating 2 dimensional ggpair scatterplots
#'
#' @param data A data frame or tibble.
#' @param title Title of the plot from the data frame or tibble.
#'
#' @return A ggpairs scatterplot representing a correlation matrix between pairs of variables
#'
#' @export
#'
#' @examples
#' scatter2d(mtcars, "Correlation Matrix")
correlation_graph <- function(.data, gg_title) {
  GGally::ggpairs(data = .data,
                  ggplot2::aes(colour = "steelblue", alpha = 0.5)) +
    ggplot2::ggtitle(gg_title)
}
