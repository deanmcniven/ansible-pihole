#!/bin/bash

set -eo pipefail

echo "Pulling latest base image"
docker pull pihole/pihole:latest

echo "Switching to PiHole image build dir"
pushd /opt/pihole/img_build

    echo "Tagging existing runtime"
    docker tag localhost:5000/panamax-pihole:latest localhost:5000/panamax-pihole:previous

    echo "Building new runtime"
    docker build -t localhost:5000/panamax-pihole:new Dockerfile

    echo "Updating latest tag"
    docker tag localhost:5000/panamax-pihole:new localhost:5000/panamax-pihole:latest

    echo "Cleanup 'new' tag"
    docker rmi localhost:5000/panamax-pihole:new

popd

echo "Restarting service"
#sudo systemctl restart pihole.service

echo "Done"
