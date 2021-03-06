# updated: 2022-04-09
FROM ubcdsci/jupyterlab:v0.9.0

RUN conda install --yes -c conda-forge \
    r-tidyverse=1.3.1 \
    r-tidymodels=0.1.4 \
    r-ggally=2.1.2 \
    r-testthat=3.1.2 \
    r-dplyr=1.0.7 \
    r-vdiffr=1.0.2 \
    r-recipes=0.2.0 \
    r-bookdown=0.25 \
    r-docopt=0.7.1 \
    r-rlang=1.0.2 \
    r-kknn=1.3.1 
