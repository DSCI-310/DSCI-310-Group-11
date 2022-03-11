# inputs
one_predictor_df <- data.frame(x = 1:5, y = 6:10)
one_predictor_formula <- x ~ y

two_predictors_df <- data.frame(x = 1:5, y = 6:10, z = 16:20)
two_predictors_formula <- x ~ y + z

three_predictors_df <- data.frame(x = 1:5, y = 6:10, z = 16:20, w = 51:55)
three_predictors_formula <- x ~ y + z + w

not_df <- list(1, 2, 3, 4)
not_formula <- "x"

recipe_type <- "recipe"
