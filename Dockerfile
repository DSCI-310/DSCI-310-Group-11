FROM ubcdsci/jupyterlab

RUN conda install --yes -c conda-forge r-tidyverse r-tidymodels r-ggally


# build using: docker build --rm -it -p 8888:8888 310project