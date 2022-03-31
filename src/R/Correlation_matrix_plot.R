#author: Jaskaran Singh 
#date: 2022-03-30

"Creates a ggpairs plot for the trained data from the Forest Fire Dataset.
Saves the plot as a png and pdf file

Usage: src/Correlation_matrix_plot.R <train> <out_dir>
" -> doc

library(tidyverse)
library(GGally)
library(tidymodels)
library(dplyr)
library(docopt)

opt <- docopt(doc)


trained_data <- read_csv(opt$train, show_col_types = FALSE)


create_plot <- trained_data %>%
  ggpairs(aes(colour = "steelblue", alpha = 0.5))

create_plot_selected <- trained_data %>% 
  select(DC, DMC, ISI, FFMC, temp, RH) %>% 
  ggpairs(aes(colour = "steelblue", alpha = 0.5))
    
  
ggsave(paste0(opt$out_dir, "/correlation_graph.png"),
         create_plot)

ggsave(paste0(opt$out_dir, "/correlation_graph_selected.png"),
       create_plot_selected)
