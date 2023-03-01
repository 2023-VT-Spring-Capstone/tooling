# Included Items
1. a docker-compose.yml to build containers for MySQL, Maxwell, Kafka, and other services.
2. A mysql_init folder includes the SQL file required to initialize the MySQL database.
3. A config folder contains the files necessary to configure the settings of both MySQL and Maxwell.

# Setup
### To start with, download the docker-compose.yml file, along with two folders named mysql_init and config. 
All three items should be in the same directory at the same level.

### Type the following command in the command line: 'docker compose up -d'.
Now you have:
1 container for MySQL
1 container for Maxwell
1 container for Zookeeper, 
3 containers for kafka brokers, 
    - kafka-1 on port 29092 between containers, localhost:9092 on host machine 
    - kafka-2 on port 29093 between containers, localhost:9093 on host machine
    - kafka-3 on port 29094 between containers, localhost:9094 on host machine
1 container for kafdrop to minotor the brokers

# Test Guide
The Maxwell service is set up to connect to the 'ODS_BASE_LOG' topic, as specified in the 'maxwell.config.properties' configuration file located in the 'config' folder. To proceed, it's necessary to create a matching topic in Kafka.

### Create a topic named "ODS_BASE_LOG" (--partitions = 3 ~ 6)
```
kafka-topics --bootstrap-server kafka-1:29092 --create --if-not-exists --replication-factor 1 --partitions 4 --topic ODS_BASE_LOG
```

### Set up a console consumer to listen to the incoming data from Maxwell.
```
kafka-console-consumer --bootstrap-server kafka-1:29092,kafka-2:29093,kafka-3:29094 --from-beginning --topic ODS_BASE_LOG
```

After creating the 'activity_info' table during the MySQL initialization process, we can test whether the data is successfully transmitted from MySQL to Kafka by inserting a row into the table.

### Insert a row in the 'activity_info' table
```
INSERT INTO activity_info VALUES (1, 'black friday deals', '1001', 'discount', '2022-11-25 00:00:00', '2022-11-28 00:00:00', NULL);
```

Last, Verify that the console is printing out the consumed data. Good luck!
