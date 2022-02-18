FROM ubcdsci/jupyterlab

RUN conda install --yes -c conda-forge r-tidyverse=1.3.1 r-tidymodels=0.1.4 r-ggally=2.1.2


# build using: docker build --rm -it -p 8888:8888 310project