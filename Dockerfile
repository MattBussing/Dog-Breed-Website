# http://containertutorials.com/docker-compose/flask-simple-app.html
# https://fmgdata.kinja.com/using-docker-with-conda-environments-1790901398
FROM heroku/miniconda
MAINTAINER Matt Bussing "mbussing44@gmail.com"

# install packages
RUN conda update conda

# install dependencies, this also makes it so that it doesn't reload every time
ADD conda.yml conda.yml
RUN conda env create -f conda.yml

# run the actual app
# exec makes it so that it will receive SIGINT
CMD ["/bin/bash", "-c", "source activate dog-breed && exec python flask_basic.py"]

# load data
# this is last, since it will likely be the one run over and over
COPY . /app
WORKDIR /app
