# Included Items
A docker-compose.yml inside 'elasticsearch' directory that is used to create containers for Elasticsearch and Kibana using existing images.

# Setup

## Create Docker images from  tar files
Download my_elasticsearch.tar and my_kibana.tar from [here](https://drive.google.com/drive/folders/1OLw3hlUDfMR5MiA9lg5oiUgFWDytUQC4?usp=sharing).

Use the following commands to load tar files and obtain images.
```
docker load -i my_elasticsearch.tar
docker load -i my_kibana.tar
```
There will be two images named 'my_elasticsearch' and 'my_kibana' available in your Docker environment.

## Create containers by Docker Compose
Use Docker Compose to create containers for Elasticsearch and Kibana.
```
cd elasticsearch
docker compose up -d
```
You will have two containers named 'elasticsearch' and 'kibana' running on your docker. Kibana container may take some time to start and connect to elasticsearch container.

## Create containers by Docker Run command
### Step 1:
```
docker network create elastic
```
Create a Docker network named 'elastic'.

### Step 2:
```
docker run -d --name elasticsearch --network elastic  -p 9200:9200 -p 9300:9300 my_elasticsearch:7.8.0
```
Create a container named 'elasticsearch' using the 'my_elasticsearch:7.8.0' image within the 'elastic' network.

### Step 3:

```
docker run -d --name kibana --network elastic  -p 5601:5601 my_kibana:7.8.0
```
Create a container named 'kibana' using the 'my_kibana:7.8.0' image within the 'elastic' network.


# Test

## Step 1
Request the password from the Elasticsearch password holder.

## Step 2
Visit 'localhost:9200' from your local browser, you should see a login window. Use the username and password you received to test if you can log in. If successful, you should see a JSON response with a 'tagline' field that reads 'You Know, for Search'.

## Step 3
Next, visit 'localhost:5601' to access Kibana, you should see a login window. Use the username and password you received to log in.

## Step 4
Click on the hamburger menu icon in the top left corner, then select 'Dev Tools' in the 'Management' section.

## Step 5
```
GET project/_search
```
Use the HTTP GET request with the endpoint project/_search in 'Console' to retrieve a previously added data in Elasticsearch. This should return the existing data along with an HTTP status code of 200 appeared on your right.
