# cayenne-develop

Quickly get a cayenne development environment running. You will need:

1. Docker

While we wait for Docker for Mac, the best option for getting docker going on OSX 
is to use VirtualBox and Docker Machine. Make sure you have `docker` / 
`docker-machine` / `docker-compose`.

## Running a Development System

With docker installed, make sure you have pulled down the submodules:

    git submodule init
    git submodule update
	
And kick off a cayenne system:

    docker-compose up
	
## Connecting to REPLs

Each cayenne component will open up an nREPL port. Connect to them using
one of four options:

- api
- indexer
- updater
- feeder

with, for example:

    ./scripts/repl.sh api
