FROM python:3.12-slim
RUN pip install poetry==1.7.1

WORKDIR /auth_service
COPY . /auth_service

RUN poetry install
CMD poetry run python -m auth_service
