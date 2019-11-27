# http://containertutorials.com/docker-compose/flask-simple-app.html
# https://fmgdata.kinja.com/using-docker-with-conda-environments-1790901398
# https://github.com/heroku/alpinehelloworld
# FROM heroku/miniconda
FROM continuumio/miniconda3:latest
MAINTAINER Matt Bussing "mbussing44@gmail.com"

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
# CMD gunicorn --bind 0.0.0.0:$PORT wsgi
ARG PORT=5000
ENV PORT=$PORT
CMD [ "/bin/bash", "-c", "conda run -n dog-breed gunicorn --bind 0.0.0.0:$PORT wsgi"]

# install packages
RUN conda update conda
RUN conda -V

# install dependencies, this also makes it so that it doesn't reload every time
ADD ./environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

# load data
# this is last, since it will likely be the one run over and over
ADD ./wsgi.py /opt/wsgi.py
ADD ./webapp /opt/webapp
WORKDIR /opt
