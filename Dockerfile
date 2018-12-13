FROM python:3.7-slim

COPY ./ /code

WORKDIR /code

RUN apt-get update && apt-get install -y gcc && \
    pip install --upgrade pip==18.0 && \
    pip install pipenv && \
    pipenv install --system --deploy

CMD ["hypercorn", "-b", "0.0.0.0:5000", "run:app.app"]

EXPOSE 5000
