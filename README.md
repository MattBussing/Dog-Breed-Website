# Dog Breed Website

This is the webite for the final project CSCI-470, Intro to Machine Learning.

## Starter Code from Saad

## Colaborators:

- Alex Michael, Grace Carter, Matt Bussing

## Helpful Commands

Build:

- `sudo docker build -t cute-puppers:latest .`

Run:

- `sudo docker run -p 5000:5000 cute-puppers`
- `gunicorn --bind 0.0.0.0:5000 wsgi`

Save conda env (don't forget to remove the prefix):

- `conda env export > bin/environment.yml`

Test:

- `conda run -n dog-breed gunicorn --bind 0.0.0.0:5000 wsgi`

## Future Things Todo:

- remove opencv and use more lightweight library
