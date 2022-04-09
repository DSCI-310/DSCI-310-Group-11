# Predicting Burned Area of Forest Fires Using KNN Regression

Authors: Amy Kong, Jaskaran Singh, Sam Zhang

## Summary

A wildfire is an uncontrolled fire that starts in the wild land vegetation and spreads quickly through the landscape. A natural occurrence, such as a lightning strike or a human-made spark, can easily initiate a wildfire and wipe away millions of properties. However, the extent to which a wildfire spreads is frequently determined by weather conditions. Wind, heat, and a lack of rain may dry out trees, bushes, fallen leaves, and limbs, making them excellent fuel for a fire. 

Given a set of meteorological data, the question that this project aims to answer is: **How large will the burned area be in the next year?**

To do this, we performed data analysis to search for the most optimized model. We split the data into training and testing sets, constructed a KNN model on the training set and evaluated its performance on the testing set. The training model's RMSE is 59.01 ha and the testing RMSE is roughly 30.1 ha. For your reference, 1 ha (hectare) is roughly equivalent to 2.47 football fields so there is a difference of 28.07 ha (70 football fields) in the RMSE between the two models. The discrepancy is quite large which suggests that the model does not appear to generalize well to new data that it has never seen before. Lastly, we discussed the implications of our results, things we can improve on, and what future research questions our project can lead to. 

## Running the Analysis
### Using Docker
**NOTE:** The current Docker image is **NOT** supported on Macs with ARM architecture (M1 chip). 
1. Install [Docker](https://www.docker.com/get-started), if not already installed
2. Clone this repository
```
git clone https://github.com/DSCI-310/DSCI-310-Group-11.git
```
3. Use the terminal/command line to navigate to the root of this project's repo 
```
cd DSCI-310-Group-11
```
4. Run the following to set up the environment:
   - For Windows, Mac, and Linux/UNIX:
   ```
   docker run -it --rm -p 8888:8888 -v /$(pwd):/opt/notebooks a0kay/dsci-310-group-11 make -C /opt/notebooks
   ```
   - For Windows using Powershell:
   ```
   docker run -it --rm -p 8888:8888 -v <absolute-path-to-directory>:/opt/notebooks a0kay/dsci-310-group-11 make -C /opt/notebooks
   ```

### Without Docker
1. Clone this repository
```
git clone https://github.com/DSCI-310/DSCI-310-Group-11.git
```
2. Install the listed [dependencies](#dependencies) below
3. At the root directory of the project, run the following in the terminal/command line:
```
make all
```

To reset the repo to a clean state use:
```
make clean
```

## Dependencies
Using R version 4.1.1

### R libraries (via. `conda-forge`)
- `r-tidyverse=1.3.1`
- `r-tidymodels=0.1.4`
- `r-ggally=2.1.2`
- `r-testthat=3.1.2`
- `r-dplyr=1.0.7`
- `r-vdiffr=1.0.2`
- `r-recipes=0.2.0`
- `r-bookdown=0.25`
- `r-docopt=0.7.1`
- `r-kknn=1.3.1`

## License 
Licensed under the MIT License and

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a><br />
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />
