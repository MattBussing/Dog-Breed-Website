# http://containertutorials.com/docker-compose/flask-simple-app.html
# https://fmgdata.kinja.com/using-docker-with-conda-environments-1790901398
# https://github.com/heroku/alpinehelloworld
FROM heroku/miniconda
MAINTAINER Matt Bussing "mbussing44@gmail.com"

# install packages
RUN conda update conda

# install dependencies, this also makes it so that it doesn't reload every time
ADD ./bin/environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

# load data
# this is last, since it will likely be the one run over and over
ADD ./webapp /opt/webapp
WORKDIR /opt/webapp

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
# CMD gunicorn --bind 0.0.0.0:$PORT wsgi
CMD ["/bin/bash", "-c", "source activate dog-breed && gunicorn --bind 0.0.0.0:$PORT wsgi"]

####################### potential
###################3

# Run the image as a non-root user
# RUN adduser --disabled-password myuser
# USER myuser

# Expose is NOT supported by Heroku
# EXPOSE 5000

# RUN apk add --no-cache --update python3 py3-pip bash
# COPY ./webapp /opt/webapp
# WORKDIR /opt/webapp

# run the actual app
# exec makes it so that it will receive SIGINT
# CMD ["/bin/bash", "-c", "source activate dog-breed && exec python flask_basic.py"]
