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

## Using a Development System

Now play around with the system, for example, look up your docker IP (in this case
the docker machine is called 'default'):

    docker-machine ip default

### Use the API

Use the API in your browser, e.g. `http://the-docker-machine-ip/works`.

### Browse the Solr Admin UI

Solr is exposed on port `8983`. Have a look what is in solr using the solr 
admin UI, e.g. `http://the-docker-machine-ip:8983/solr` in your browser.
	
### Connecting to REPLs

Each cayenne component will open up an nREPL port. Connect to them using
one of four options:

- api
- indexer
- updater
- feeder

with, for example:

    ./scripts/repl.sh api

## HELP!

Stuff you should watch out for:

- **Some services never 'start'?**
  If running docker within a VM, give the VM 4GB or so of RAM.
- **I tried to connect to the services, but the connection timed out!**
  It can take a long time for the cayenne components to properly start. Wait until you 
  see messages like 'Starting :api... done.'
