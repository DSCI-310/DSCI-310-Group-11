all: notebooks/forest-fire-analysis.html

# download data
data/fire_data.csv : src/R/download_data.R
		Rscript src/R/download_data.R <args>

# data pre-processing: split into training and testing sets
results/fire_train.csv : data/fire_data.csv src/R/train_test_splits.R
		Rscript src/R/train_test_splits.R <args>

results/fire_test.csv : data/fire_data.csv src/R/train_test_splits.R
		Rscript src/R/train_test_splits.R <args>

# correlation plots
results/correlation_graph.png : data/training_data.csv src/R/Correlation_matrix_plot.R
		Rscript src/R/Correlation_matrix_plot.R data/training_data.csv results

results/correlation_graph_selected.png : data/training_data.csv src/R/Correlation_matrix_plot.R
		Rscript src/R/Correlation_matrix_plot.R data/training_data.csv results

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
		rm -f results/best_k.csv results/testing_rmse.csv