# KL FHIR starter project


* Clone this project
* Step into the cloned folder
* Run the following: `docker run -p 80:8080 -v $(pwd)/configs:/configs -e "--spring.config.location=file:///configs/kl.yaml" hapiproject/hapi:latest`
* Done!




# Modifying the templates using an exploded version of the HAPI FHIR starter project

1) Build the docker image with the provided Dockerfile (eg. ```docker build . --no-cache -t kl-gateway ```).
2) Start the docker container by eg: ```docker run -p 8080:8080  -v $(pwd)/configs:/configs -e "--spring.config.location=file:///configs/kl.yaml" kl-gateway```
3) Enjoy!
