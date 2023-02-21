# Kafka with docker compose (for local development/testing)
kafka needs the java runtime to run. Here we install the Kafka using a simple docker file.



## copy server.properties to host
```
docker cp kafka-1:/etc/kafka/server.properties ./config/kafka-1/server.properties
docker cp kafka-2:/etc/kafka/server.properties ./config/kafka-2/server.properties
docker cp kafka-3:/etc/kafka/server.properties ./config/kafka-3/server.properties
```

## We want to keep the container as small as possible
1. we can install vi/vim in the container and modify the properties
2. mount files into container. Use set volumes in docker-compose.yaml
therefore, /config is for changing the config in containers. /data is for saving data at Host machine.




## Create a topic
```
/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper-1:2181 --replication-factor 1 --partitions 3 --topic ODS_BASE_LOG

## during deployment, choose multiple brokers (some machine may fail)
/kafka/bin/kafka-topics.sh --create --bootstrap-server zookeeper-1:2181,zookeeper-2:2181,zookeeper-3:2181  --replication-factor 1 --partitions 3 --topic TOPIC_NAME
```

## List all topics
```
/kafka/bin/kafka-topics.sh --zookeeper zookeeper-1:2181 --list
```

## Describe a topic
```
/kafka/bin/kafka-topics.sh --zookeeper zookeeper-1:2181 --describe --topic ODS_BASE_LOG
```

## Delete topic
```
/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic ODS_BASE_LOG
```

## Consumer
```
/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-1:9092,kafka-2:9092,kafka-3:9092 --topic ODS_BASE_LOG --from-beginning
```
after the command above the terminal is listening

## Producer
```
docker exec -it kafka-producer bash 
echo "New Message: 1" | /kafka/bin/kafka-console-producer.sh --broker-list kafka-1:9092,kafka-2:9092,kafka-3:9092 --topic ODS_BASE_LOG > /dev/null

/kafka/bin/log.sh 2023-02-19 | /kafka/bin/kafka-console-producer.sh --broker-list kafka-1:9092,kafka-2:9092,kafka-3:9092 --topic ODS_BASE_LOG > /dev/null
```


## Connections
LISTENERS are what interfaces Kafka binds to. ADVERTISED_LISTENERS are how clients can connect.

```
apt-get update
apt-get install net-tools
netstat -an
```


## Reference:
https://stackoverflow.com/questions/51630260/connect-to-kafka-running-in-docker
