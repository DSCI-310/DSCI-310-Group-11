# Makefile
# Group 11, April 1st
#
# This script completes the whole analysis of the project including
# loading/transforming the data, creating two plots, tuning and fitting
# a model as well as rendering the final report. This script takes no
# arguments.
#
#Usage to run entire analysis: make all
#      to clean the entire analysis: make clean


all: notebooks/forest-fire-analysis.html

# loading the data
data/forestfires.csv : data/forestfires.csv src/R/data_cleaning.R
		Rscript src/R/data_cleaning.R data/forestfires.csv data
		
# tidying the data
data/cleaned_data.csv : data/forestfires.csv src/R/data_tidying.R
		Rscript src/R/data_tidying.R data/forestfires.csv data

# data pre-processing: split into training and testing sets
data/training_data.csv : data/cleanedData.csv src/R/data_splitting.R
		Rscript src/R/data_splitting.R data/cleanedData.csv data

data/testing_data.csv : data/cleaned_data.csv src/R/data_splitting.R
		Rscript src/R/data_splitting.R data/cleanedData.csv data

# correlation plots
results/correlation_graph.png : data/scaled_and_centered_training_data.csv src/R/Correlation_matrix_plot.R
		Rscript src/R/correlation_matrix_plot.R data/scaled_and_centered_training_data.csv results

results/correlation_graph_selected.png : data/scaled_and_centered_training_data.csv src/R/correlation_matrix_plot.R
		Rscript src/R/correlation_matrix_plot.R data/scaled_and_centered_training_data.csv results

# tune model - find the best k for k-nn
results/best_k.csv : data/training_data.csv src/R/tune_model.R
		Rscript src/R/tune_model.R data/training_data.csv results

# fit model - test model performance using RMSE metric
results/testing_rmse.csv : data/training_data.csv data/testing_data.csv results/best_k.csv src/R/fit_model.R
		Rscript src/R/fit_model.R data/training_data.csv data/testing_data.csv results/best_k.csv results

# render report
notebooks/forest-fire-analysis.html : notebooks/forest-fire-analysis.Rmd  results/best_k.csv results/testing_rmse.csv
		Rscript -e "rmarkdown::render('notebooks/forest-fire-analysis.Rmd')"

clean:
		rm -f data/training_data.csv data/testing_data.csv 
		rm -f results/correlation_graph.png results/correlation_graph_selected.png
		rm -f data/scaled_and_centered_training_data.csv data/cleanedData.csv
		rm -f results/best_k.csv results/testing_rmse.csv