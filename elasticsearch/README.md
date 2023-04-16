# Introduction

This 'elasticsearch' directory contains two subdirectories, namely 'compose' and 'tar'. You can ignore them if you are seeking our project's customized Elasticsearch and Kibana's images from Docker Hub.

I will guide you on how to Docker Pull from Docker Hub to obtain customized Elasticsearch and Kibana images and create configured containers. This is the most efficient way of acquiring images.

The 'compose' directory will guide you on how to use Docker Compose to obtain official original images from Docker Hub to create containers for Elasticsearch and Kibana, followed by manual configuration steps.

The 'tar' directory will guide you on how to use existing tar files to create containers for Elasticsearch and Kibana using the Docker Compose and Docker Run methods.

# Setup
## Method 1: Docker Compose (fastest)
```
docker compose up -d
```
To automatically pull the Elasticsearch and Kibana images from Docker Hub and create containers within the same Docker network named 'elastic', navigate to the directory containing the Docker compose file and run the command..

## Method 2: Docker Run
### Step 1:
```
docker pull laynelmoon/elasticsearch:7.8.0
docker pull laynelmoon/kibana:7.8.0
```
This will pull the elasticsearch and kibana's images from my docker hub to your local docker.

### Step 2:
```
docker network create elastic
```
Create a Docker network named 'elastic'.

### Step 3:
```
docker run -d --name elasticsearch --network elastic -p 9200:9200 -p 9300:9300 laynelmoon/elasticsearch:7.8.0
```
This will use the image 'laynelmoon/elasticsearch:7.8.0' to create a container named 'elasticsearch' within the 'elastic' network.

### Step 4:
```
docker run -d --name kibana --network elastic -p 5601:5601 laynelmoon/kibana:7.8.0
```
This will use the image 'laynelmoon/kibana:7.8.0' to create a container named 'elasticsearch' within the 'elastic' network.


# Credentials
### username: elastic
### password: lIaOuoKHcJcM173Ei8U7

## To disable security check (Credentials check)
### Step 1:
```
docker exec -it elasticsearch bash
```
Start an interactive bash shell session inside the elasticsearch container.

### Step 2:
```
vi config/elasticsearch.yml
.
.
xpack.security.enabled: false
```
Edit the elasticsearch.yml file and set 'xpack.security.enabled' to 'false'.

### Step 3:
```
exit
docker restart elasticsearch
```
Exit from the bash.
Restart the elasticsearch container.

# Test
## Step 1
Visit 'localhost:9200' from your local browser, you should see a login window. Use the username and password to test if you can log in. If successful, you should see a JSON response with a 'tagline' field that reads 'You Know, for Search'.

## Step 2
Next, visit 'localhost:5601' to access Kibana, you should see a login window. Use the username and password to log in.

## Step 3
Click on the hamburger menu icon in the top left corner, then select 'Dev Tools' in the 'Management' section.

## Step 4
```
GET project/_search
```
Use the HTTP GET request with the endpoint project/_search in 'Console' to retrieve a previously added data in Elasticsearch. This should return the existing data along with an HTTP status code of 200 appeared on your right.


# Create containers snapshots for easy distribution and deployment
## Push to Docker Hub
### Docker Commit
```
docker commit <container-name> <username>/<image-name>:<tag>
```
 `<container-name>` can be replaced by `<container-id>`. `<username>` is your Docker Hub's username. You can customized your `<tag>`. It will then create a new image with the name `<username>/<image-name>:<tag>`.

### Docker Login
```
docker login
```
Login to your Docker Hub first. Enter your username and password.

### Docker Push
```
docker push <username>/<image-name>:<tag>
```
This will push the image to your docker hub.

### Docker Pull
```
docker pull <username>/<image-name>:<tag>
```
This will pull the image from your docker hub to local docker.

### Docker Tag (bonus)
```
docker tag <image_name> <repository>:<tag>
```
`<image_name>` is the name or id of your local image, `<repository>` is the name of the repository that you are going to push.

## Save as Tar File
### Docker Commit
```
docker commit elasticsearch my_elasticsearch:7.8.0
```
Creating a new image named 'my_elasticsearch' with tag '7.8.0' from container 'elasticsearch'.

### Docker Save
```
docker save my_elasticsearch:7.8.0 -o my_elasticsearch.tar
```
Saving 'my_elasticsearch' image to a tar archive file named 'my_elasticsearch.tar'.

### Docker Load
```
docker load -i my_elasticsearch.tar
```
Loading an image from a tar archive file 'my_elasticsearch.tar' into the Docker