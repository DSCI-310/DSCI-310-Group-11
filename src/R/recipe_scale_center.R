#' Create a recipe to preprocess data
#'
#' Creates a recipe by scaling and centering the given data,
#' and creates a model using the given formula.
#'
#' @param dataframe A data frame or a tibble of the data.
#' @param formula The formula used to create the model (eg: target ~ predictor).
#'
#' @return A tidymodel recipe, specifying inputs, outputs, and steps
#' (scaling and centering) applied to all predictors.
#'
#' @export
#'
#' @examples
#' recipe_scale_center(training_cars, mpg ~ hp)
#' recipe_scale_center(training_cars, mpg ~ hp + cyl)
#' recipe_scale_center(training_cars, mpg ~ .)
recipe_scale_center <- function(dataframe, formula) {
  if (!is.data.frame(dataframe)) {
    stop("`recipe_scale_center` expects a data frame")
  }

  if (class(formula) != "formula") {
    stop("`recipe_scale_center` expects a formula in the form
         `target ~ predictor(s)")
  }
  recipes::recipe(formula, data = dataframe) %>%
    recipes::step_center(recipes::all_predictors()) %>%
    recipes::step_scale(recipes::all_predictors())
}
