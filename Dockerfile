FROM heroku/miniconda

# install packages
RUN conda update conda
ADD conda.yml conda.yml
RUN conda env create -f conda.yml
