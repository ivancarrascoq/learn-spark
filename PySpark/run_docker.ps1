#!/usr/bin/env pwsh
################################################
#  Descripción:                                #
#  Crea la imagen, corre y ejecuta localmente  #
#  Se conecta al contenedor. Después, borra el #
#  contenedor y la imagen. [IC]                #
#                                              #
#  Uso: .\run_docker.ps1                       #
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
$DOCKER_IMAGE_NAME = "jupyter_pyspark_v2"
$PORT = 8887

function Build-AndRunContainer {
    Write-Host "===> Building Docker image..."
    docker build -t $DOCKER_IMAGE_NAME .

    Write-Host "===> Running Docker container..."

    docker run -d --name $DOCKER_IMAGE_NAME `
        -p "$PORT`:8888" `
        -v "$(Get-Location)/data:/home/jovyan/work" `
        -e PYSPARK_PYTHON=python3 `
        -e SPARK_MASTER="local[*]" `
        $DOCKER_IMAGE_NAME `
        start-notebook.sh --NotebookApp.token='' --NotebookApp.password=''

    Write-Host "Deployment complete!"
}

function Connect-ToContainer {
    Write-Host "===> Connecting to Docker container..."
    Write-Host "===> You can connect to Jupyter Notebook using your browser http://localhost:$PORT"
    docker exec -it $DOCKER_IMAGE_NAME /bin/bash
}

function Remove-Container {
    Write-Host "===> Removing Docker container..."
    docker rm -f $DOCKER_IMAGE_NAME
}

function Remove-Image {
    Write-Host "===> Removing Docker image..."
    docker rmi -f $DOCKER_IMAGE_NAME
}

# Ejecutar funciones
Build-AndRunContainer
Connect-ToContainer
Remove-Container
Remove-Image
