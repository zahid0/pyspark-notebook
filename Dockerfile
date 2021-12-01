FROM jupyter/pyspark-notebook
USER root
RUN wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop3-latest.jar -O /usr/local/spark/jars/gcs-connector-hadoop3-latest.jar
USER jovyan
