FROM python:3.10-alpine

WORKDIR /app

RUN pip3 install flask

COPY . /app

# RUN mkdir /logs

ENTRYPOINT ["python3"]
CMD ["app.py"]

