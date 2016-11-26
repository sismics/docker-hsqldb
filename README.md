# docker-backupninja
Dockerfile for HSQLDB

## Instructions

Run with the following command:
```
docker run -d --name hsqldb --restart=always \
    -v hsqldb_data:/data \
    -e "DB_NAME=mydb" \
    sismics/hsqldb
```

This will create a container hsqldb, mounting volume hsqldb_data, exposing database /data/mydb on 9001.