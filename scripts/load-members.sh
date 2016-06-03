#!/bin/sh

docker-compose run --rm api lein run -m cayenne.tasks/load-members
