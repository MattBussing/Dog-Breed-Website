FROM heroku/heroku:18

RUN pip install -U pip

RUN pipenv install
