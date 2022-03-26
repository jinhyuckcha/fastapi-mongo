FROM python:3.8-slim
LABEL maintainer="chacha, ckwlsgur20@gmail.com"
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PYTHON_VERSION=3.8

# Install and setup poetry
RUN pip install -U pip \
    && apt-get update \
    && apt install -y curl netcat \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
ENV PATH="${PATH}:/root/.poetry/bin"

COPY . /home
WORKDIR /home
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

EXPOSE 80
ENTRYPOINT ["bash", "/home/run.sh"]