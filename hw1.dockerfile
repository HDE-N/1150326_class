# dockerfile
from python:3.15.0a7-slim

# label key=value
maintainer a0901183567@gmail.com

arg root_dir=/app

env root=${root_dir} \
    pythonencoding=utf-8

copy requirements.txt ${root_dir}/requirements.txt

run pip3 install --no-cache-dir -r requirements.txt

run mkdir -p "${root_dir}/src/static/config" && \
    mkdir -p "${root_dir}/src/static/data"

copy src/*.py ${root_dir}/src/ 

workdir /app

expose 5000

cmd python3 src/app.py
