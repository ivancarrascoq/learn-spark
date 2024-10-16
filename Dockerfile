FROM jupyter/pyspark-notebook:latest
USER root

RUN apt-get update && apt-get install -y \
    && apt-get clean
# RUN apt-get update 
# && apt-get install python3-boto3 -y

RUN mkdir -p /home/jovyan/work && chown -R jovyan:users /home/jovyan/work

COPY requirements.txt /home/jovyan/
RUN pip install -r /home/jovyan/requirements.txt

# COPY jupyter_config.json /home/jovyan/

WORKDIR /home/jovyan/work

USER jovyan
