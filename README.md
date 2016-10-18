# cayenne-develop

Quickly get a cayenne development environment running. You will need:

1. Docker

Install Docker for Mac or Docker Machine.

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
    
When using Docker for Mac container ports will appear on `localhost`.

### Use the API

Use the API in your browser, e.g. `http://the-docker-machine-ip/works`.

### Use the Data Proxy

The data proxy service is exposed on port `3002`:

    curl -iH "Accept: text/turtle" http://the-docker-machine-ip:3002/10.5555/12345678
	
### Use Metadata Search

Metadata search runs on port `3003`. Open your browser and go to:

    http://the-docker-machine-ip:3003
	
### Use the Crossmark Dialog Server

A Crossmark dialog server runs on port `3004`. In your browser:

    http://the-docker-machine-ip:3004

### Browse the Solr Admin UI

Solr is exposed on port `8983`. Have a look what is in solr using the solr 
admin UI, e.g. `http://the-docker-machine-ip:8983/solr` in your browser.

### Connect the Mongo Command-line Client

    ./scripts/mongo.sh

### Load in Some Data

Load in real data using the scripts in `./scripts`:

- `./scripts/load-funders.sh`
- `./scripts/load-members.sh`
- `./scripts/load-journals.sh`
- `./scripts/load-last-day-works.sh`
	
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
