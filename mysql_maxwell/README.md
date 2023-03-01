# Included Items
1. a docker-compose.yml to build containers for MySQL, Maxwell, Kafka, and other services.
2. A mysql_init folder includes the SQL file required to initialize the MySQL database.
3. A config folder contains the files necessary to configure the settings of both MySQL and Maxwell.

# Setup
### Download or clone the mysql_maxwell folder. 

All three items should be in the same directory at the same level.

### Type 'docker compose up -d' in the command line.

Now you have: <br>
1 container for MySQL, <br>
1 container for Maxwell, <br>
1 container for Zookeeper, <br>
3 containers for kafka brokers, <br>
&nbsp;- kafka-1 on port 29092 between containers, localhost:9092 on host machine <br>
&nbsp;- kafka-2 on port 29093 between containers, localhost:9093 on host machine <br>
&nbsp;- kafka-3 on port 29094 between containers, localhost:9094 on host machine <br>
1 container for kafdrop to minotor the brokers <br>

# Test Guide
The Maxwell service is set up to connect to the 'ODS_BASE_LOG' topic. To proceed, it's necessary to create a matching topic in Kafka.

### Execute kafka-1 container with root permission
```
docker exec -it -u root kafka-1 bash
```

### Create a topic named "ODS_BASE_LOG" (--partitions = 3 ~ 6)
```
kafka-topics --bootstrap-server kafka-1:29092 --create --if-not-exists --replication-factor 1 --partitions 4 --topic ODS_BASE_LOG
```

### Set up a console consumer to listen to the incoming data from Maxwell
```
kafka-console-consumer --bootstrap-server kafka-1:29092,kafka-2:29093,kafka-3:29094 --from-beginning --topic ODS_BASE_LOG
```

After creating the 'activity_info' table in 'gmall' database during the MySQL initialization process, we can test whether the data is successfully transmitted from MySQL to Kafka by inserting a row into the table. I am using MySQL Workbench for this task, but you may use your preferred method.
The passwords for the users are specified in the docker compose file.

### Insert a row in the 'activity_info' table
```
USE gmall;
INSERT INTO activity_info VALUES (1, 'black friday deals', '1001', 'discount', '2022-11-25 00:00:00', '2022-11-28 00:00:00', NULL);
```

### Verify that the console is printing out the consumed data

#Additional Instructions

In the event that the maxwell container shuts down, follow the steps below to restart and rebuild the connection with MySQL and Kafka.

### Execute maxwell container
```
docker exec -it maxwell /bin/bash
```

### Start the Maxwell replication tool in daemon mode
```
bin/maxwell --config config.properties --daemon
```

Good luck!
