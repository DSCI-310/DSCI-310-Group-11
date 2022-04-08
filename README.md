# Predicting Burned Area of Forest Fires Using k-NN Regression

Authors: Amy Kong, Jaskaran Singh, Sam Zhang

## Summary

A wildfire is an uncontrolled fire that starts in the wildland vegetation and spreads quickly through the landscape. A natural occurrence, such as a lightning strike, or a human-made spark can easily initiate a wildfire and wipe away millions of properties. However, the extent to which a wildfire spreads is frequently determined by weather conditions. Wind, heat, and a lack of rain may dry out trees, bushes, fallen leaves, and limbs, making them excellent fuel for a fire. In this project, **we wish to predict the burned area of forests based on several environmental factors with a k-NN regression model**. By establishing a transparent link between them, it is possible to identify potential risk factors and take appropriate safeguards to prevent the emergence of forest fires and the disasters they generate.

## Running the Analysis
### Using Docker
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
```
docker run -it --rm -p 8888:8888 -v /$(pwd):/opt/notebooks a0kay/dsci-310-group-11 make -C /opt/notebooks
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
### R libraries
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
