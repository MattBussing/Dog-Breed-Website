# http://containertutorials.com/docker-compose/flask-simple-app.html
# https://fmgdata.kinja.com/using-docker-with-conda-environments-1790901398
# https://github.com/heroku/alpinehelloworld
FROM heroku/miniconda
MAINTAINER Matt Bussing "mbussing44@gmail.com"

# RUN apk add --no-cache --update python3 py3-pip bash

# install packages
RUN conda update conda

# install dependencies, this also makes it so that it doesn't reload every time
ADD ./bin/conda.yml /tmp/conda.yml
RUN conda env create -f /tmp/conda.yml

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# run the actual app
# exec makes it so that it will receive SIGINT
# CMD ["/bin/bash", "-c", "source activate dog-breed && exec python flask_basic.py"]

# load data
# this is last, since it will likely be the one run over and over
COPY ./webapp /opt/webapp
WORKDIR /opt/webapp

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD gunicorn --bind 0.0.0.0:$PORT wsgi

# Expose is NOT supported by Heroku
# EXPOSE 5000
