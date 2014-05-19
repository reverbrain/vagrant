#!/bin/bash

apt-get update && apt-get install curl -y

cp -v repo.reverbrain.list /etc/apt/sources.list.d/reverbrain.list
curl -S http://repo.reverbrain.com/REVERBRAIN.GPG | apt-key add -

echo "Updating packages"
apt-get update
apt-get install elliptics rift -y

mkdir -p /opt/elliptics/history.2 && chmod 777 /opt/elliptics/history.2
mkdir -p /opt/elliptics/eblob.2/ && chmod 777 /opt/elliptics/eblob.2/
mkdir -p /opt/elliptics/eblob.2/data

echo "Starting dnet_ioserv at port 1025. "
dnet_ioserv -c ioserv.json&

if [ $? -eq 0 ]; then
	echo "Started succefully"
fi
disown

echo "Waiting"
sleep 10

echo "Starting rift at 8080. "
rift_server -c server-config.json&

if [ $? -eq 0 ]; then
	echo "Started succefully"
fi
disown
