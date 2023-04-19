# Introduction

The config folder contains the files necessary to configure the settings of Maxwell.

# Instructions

In case the Maxwell container shuts down or fails to transmit data from MySQL to Kafka, perform the following steps to restart and rebuild the connection.

### Execute maxwell container
```
docker exec -it maxwell /bin/bash
```

### Start the Maxwell replication tool in daemon mode
```
bin/maxwell --config config.properties --daemon
```

