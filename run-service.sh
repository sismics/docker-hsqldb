#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 [db] [app]"
    echo "  Example: $0 mydb myapp. This will create a container mydb_hsqldb, mounting volume myapp_hsqldb_data, exposing database /data/mydb on 9001"
    exit 1
fi

docker rm -f $2_hsqldb
docker run -d --name $2_hsqldb --restart=always \
    -v $2_hsqldb_data:/data \
    -e "DB_NAME=$1" \
    sismics/hsqldb
