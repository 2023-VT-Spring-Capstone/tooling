# Introduction
The 'compose' directory will guide you on how to use Docker Compose to obtain official original images from Docker Hub to create containers for Elasticsearch and Kibana, followed by manual configuration steps.

# Included Items
Inside 'elasticsearch' directory, you have
1. A docker-compose.yml to create containers for Elasticsearch and Kibana.
3. A config folder contains the configuration files for Elasticsearch and Kibana.

# Setup

### Step 1:

```
docker compose up -d
```
Use docker compose to create containers for Elasticsearch and Kibana. You will have two containers named 'elasticsearch' and 'kibana' running on your docker.

## Elasticsearch
### Step 2:
```
docker exec -it elasticsearch bash
```
Start an interactive bash shell session inside the elasticsearch container. It allows you to run commands and interact with the container's file system.

### Step 3:
```
cd /usr/share/elasticsearch
```
This is just to make sure you navigate to the Elasticsearch installation directory.

### Step 4:
```
bin/elasticsearch-certutil cert -out config/elastic-certificates.p12 -pass ""
```
Use this command to generate a certificate, which will be located in the config folder after generation. At this point, there will be two additional files in the /usr/share/elasticsearch/config directory: elastic-certificates.p12 and elasticsearch.keystore.

### Step 5:
```
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config/
```
Change file user permissions.

### Step 6:
```
vi /usr/share/elasticsearch/config/elasticsearch.yml
```
Modify the config/elasticsearch.yml file inside the container by completely overwriting its contents with those of the local config/elasticsearch.yml file.

### Step 7:
```
exit
docker restart elasticsearch
```
Exit from the bash.
Restart the elasticsearch container.

### Step 8:
```
docker exec -it elasticsearch bash
```
Start an interactive bash shell session again.

### Step 9:
```
elasticsearch-setup-passwords auto
```
This command will generate passwords, which you need to save manually. Enter 'y' if it asks you whether you would like to continue.

If you want to set the password yourself, please execute:
```
elasticsearch-setup-passwords interactive
```

## Kibana
### Step 10:
```
exit
docker exec -it kibana bash
```
Exit from the bash. Start an interactive bash shell session inside the kibana container.

### Step 11:
```
vi /usr/share/kibana/config/kibana.yml
```
Modify the config/kibana.yml file inside the container by completely overwriting its contents with those of the local config/kibana.yml file. Note that you must enter the password you generated for the 'kibana_system' user.


### Step 12:
```
exit
docker restart kibana
```
Exit from the bash.
Restart the kibana container.



# Test

## Step 1
Visit 'localhost:9200' from your local browser, you should see a login window. Use any username and its password you generated to test if you can log in. If successful, you should see a JSON response with a 'tagline' field that reads 'You Know, for Search'.

## Step 2
From your local browser, visit 'localhost:5601' to access Kibana and you should see a login window. Use the username and password you generated for the user 'elastic' to log in.

## Step 3
Click on the hamburger menu icon in the top left corner, then select 'Dev Tools' in the 'Management' section.

## Step 4
```
PUT /project/_doc/1
{
  "id": 1,
  "title": "Real-time monitoring of volatile, retail investor-drivenprice",
  "memberList":[
    {"id":1,"name":"Huai-Che Chang"},
    {"id":2,"name":"Wen-Fang Lu"},
    {"id":3,"name":"Wan-Yi Mao"},
    {"id":4,"name":"Layne Pu"}]
}
```
In the console, create a request using the PUT operation to instruct Elasticsearch to create a document with an ID of 1 in the 'project' index.

## Step 5
```
GET project/_search
```
Next, create a query request using the GET operation to instruct Elasticsearch to perform a search query in the 'project' index, returning all documents within the 'project' index. You should see the document you added earlier and an Http status code of 200 on your right.
