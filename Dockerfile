# followed https://github.com/heroku/docker-python/blob/3/Dockerfile
# FROM heroku/heroku:18
FROM heroku/miniconda

# install packages
RUN conda update conda
ADD conda.yml conda.yml
RUN conda env create -f conda.yml
