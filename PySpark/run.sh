docker build -t jupyter-notebook-spark .
# docker tag jupyter-notebook-spark:latest jupyter-notebook-sparke:v1.0
docker run -p 8888:8888 --name jupyter-notebook-container jupyter-notebook-spark

docker stop jupyter-notebook-container
docker rm jupyter-notebook-container