FROM nvidia/cuda:11.3.1-runtime-ubuntu20.04

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ "America/Sao_Paulo"
ENV PYTHONUNBUFFERED 1

COPY poetry.lock pyproject.toml ./
RUN  apt-get update \
 && apt-get install -y --no-install-recommends python3 python3-pip \
 && pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir poetry \
 && poetry config virtualenvs.create false \
 && poetry install --no-dev \
 && pip uninstall --yes poetry \
 && mkdir /workspace

WORKDIR /workspace
