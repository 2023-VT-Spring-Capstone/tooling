# Demo 
### creating one Zookeeper container and one Kafka container using docker compose ver. 3

## usuage

start service in backround mode
```
docker-compose -f docker-compose.yml up -d
```

check if the containers are running
```
docker ps
```
stop the containers
```
docker-compose down
```

Use interaction mode with bash shell
```
docker exec -it kafka /bin/bash
cd /opt/kafka/kafka_xxxxxx
ls
```

in /bin all the executable scripts are stored here.


### create a topic with 1 replication and 1 partition
```
kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partition 1 --topic TOPIC_NAME_1
kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partition 1 --topic TOPIC_NAME_2
```
refer to environment: KAFKA_ZOOKEEPER_CONNECT

### list all the topics under the same kafka
```
kafka-topics.sh --list --zookeeper zookeeper:2181
```

### note
right now kafka has no method to rename topics.
