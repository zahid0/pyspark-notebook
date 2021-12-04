FROM jupyter/pyspark-notebook

USER root

RUN apt-get update && apt-get install build-essential -y \
  && wget -q https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop3-latest.jar -O /usr/local/spark/jars/gcs-connector-hadoop3-latest.jar \
  && wget -q http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
  && tar -xf ta-lib-0.4.0-src.tar.gz \
  && cd ta-lib \
  && ./configure --prefix=/usr \
  && make && make install \
  && cd .. && rm -rf ta-lib ta-lib-0.4.0-src.tar.gz

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

USER jovyan
