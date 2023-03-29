# Introduction
This 'elasticsearch' directory contains two subdirectories, namely 'compose' and 'tar'.

The 'compose' directory will guide you on how to use Docker Compose to obtain images from Docker Hub to create containers, followed by manual configuration steps.

The 'tar' directory will guide you on how to use existing tar files to create containers using the Docker Compose and Docker Run methods.

# Create containers snapshots for easy distribution and deployment

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