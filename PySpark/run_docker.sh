#!/bin/bash
################################################
#  Descripcion:                                #
#  crea la image, corre y ejecuta localmente   #
#  Se conecta al contenedor. Despues, borra el #
#  contenedor y la imagen. [IC]                #
#                                              #
#  Uso: ./run_docker.sh                        #
#                                              #
#  Requisitos:                                 #
#  - Docker Desktop instalado                  #
#  - Docker Desktop corriendo                  #
#  - Tener permisos para ejecutar el script    #
#  - Tener la carpeta 'data' con permisos      #
#    de escritura en el mismo nivel que el     #
#    Dockerfile.                               #
#                                              #
#  Notas:                                      #
#  - Se debe correr el script en la carpeta    #
#    donde se encuentra el Dockerfile.         #
#  - Se debe tener permisos para ejecutar el   #
#    script.                                   #
#                                         [IC] #
#                                              #
################################################

# Variables
DOCKER_IMAGE_NAME="jupyter_pyspark_v2"
PORT=8887

build_and_run_container(){
    echo "===> Building Docker image..."
    docker build -t "$DOCKER_IMAGE_NAME" .

    echo "===> Running Docker container..."

    docker run -d --name "$DOCKER_IMAGE_NAME" \
        -p "$PORT":8888 \
        -v $(pwd)/data:/home/jovyan/work \
        -e PYSPARK_PYTHON=python3 \
        -e SPARK_MASTER=local[*] \
        "$DOCKER_IMAGE_NAME" \
        start-notebook.sh --NotebookApp.token='' --NotebookApp.password=''

    echo "Deployment complete!"
}

connect_to_container(){
    echo "===> Connecting to Docker container..."
    echo "===> You can connect to Jupyter Notebook using your browser http://localhost:8887"
    docker exec -it "$DOCKER_IMAGE_NAME" /bin/bash
}

removes_container(){
    echo "===> Removing Docker container..."
    docker rm -f "$DOCKER_IMAGE_NAME"
}

removes_image(){
    echo "===> Removing Docker image..."
    docker rmi -f "$DOCKER_IMAGE_NAME"
}

# echo $(pwd)
build_and_run_container
connect_to_container
removes_container
removes_image