# fastapi-pymongo

## Install

```
# virtual env 안만드는 옵션
poetry config virtualenvs.create false
poetry install --no-interaction --no-ansi
```

## Run

`cp .env.local .env`
start db
`docker-compose up -d`

run app
`./run-uvicorn.sh`

## code convention

`flake8 .`
`mypy .`
