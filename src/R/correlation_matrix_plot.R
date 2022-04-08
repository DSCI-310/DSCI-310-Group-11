# author: Jaskaran Singh
# date: 2022-03-30

"Creates a ggpairs plot for the trained data from the Forest Fire Dataset.
Saves the plot as a png.

Usage: src/R/correlation_matrix_plot.R <train> <out_dir>
" -> doc

suppressPackageStartupMessages({
  library(tidyverse)
  library(GGally)
  library(tidymodels)
  library(dplyr)
  library(docopt)
})

options(repr.plot.width = 10, repr.plot.height = 14)

opt <- docopt(doc)

# load data -------------------------------------------------------------------
trained_data <- read_csv(opt$train, show_col_types = FALSE)

# create ggpairs plot ---------------------------------------------------------
# ggpairs plot for all variables
create_plot <- trained_data %>%
  ggpairs(
    lower = list(continuous = wrap("points", size = 0.3, color = "steelblue", alpha = 0.5)),
    diag = list(continuous = wrap("densityDiag", fill = "steelblue"))
  ) +
  ggplot2::theme(axis.text.x = element_text(angle = 45, size = 7))

# ggpairs plot for select variables
create_plot_selected <- trained_data %>%
  select(DC, DMC, ISI, FFMC, temp, RH) %>%
  ggpairs(
    lower = list(continuous = wrap("points", size = 0.3, color = "steelblue", alpha = 0.5)),
    diag = list(continuous = wrap("densityDiag", fill = "steelblue"))
  ) +
  ggplot2::theme(axis.text.x = element_text(angle = 40, size = 7))

# save the plots --------------------------------------------------------------
ggsave(
  paste0(opt$out_dir, "/correlation_graph.png"),
  create_plot
)

ggsave(
  paste0(opt$out_dir, "/correlation_graph_selected.png"),
  create_plot_selected
)
