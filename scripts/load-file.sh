#!/bin/sh

docker exec cayennedevelop_feeder_1 mkdir -p /app/data/feed-in
docker exec cayennedevelop_feeder_1 mkdir -p /app/data/feed-failed
docker exec cayennedevelop_feeder_1 mkdir -p /app/data/feed-processed

docker cp $1 cayennedevelop_feeder_1:/app/data/feed-in/$(basename $1)
