FROM python:3.7-slim-buster
LABEL maintainer='Agustin Rodriguez <gus990@gmail.com>'

ENV MINIO_ACCESS_KEY=minio
ENV MINIO_SECRET_KEY=minio123

WORKDIR /home

COPY ./start_services.sh ./start_services.sh

RUN apt update && \
    apt install -y wget

RUN pip install \
    mlflow \
    lightgbm \
    boto3

RUN wget https://dl.min.io/server/minio/release/linux-amd64/minio && \
    chmod +x minio && \
    chmod +x start_services.sh

ENTRYPOINT [ "bash" ]
CMD ["./start_services.sh"]