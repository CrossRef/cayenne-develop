#!/bin/sh

case $1 in
    api)
	nrepl_port=7880
	;;
    indexer)
	nrepl_port=7881
	;;
    updater)
	nrepl_port=7882
	;;
    feeder)
	nrepl_port=7883
	;;
esac

docker-compose run --rm $1 lein repl :connect $1:$nrepl_port
