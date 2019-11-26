# http://containertutorials.com/docker-compose/flask-simple-app.html
# https://fmgdata.kinja.com/using-docker-with-conda-environments-1790901398
FROM heroku/miniconda
MAINTAINER Matt Bussing "mbussing44@gmail.com"

# install packages
RUN conda update conda

# load data
COPY . /app
WORKDIR /app

# install dependencies
RUN conda env create -f conda.yml

# run the actual app
CMD /bin/bash -c “source activate dog-breed && exec python application.py
