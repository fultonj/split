#!/usr/bin/env bash

source ~/stackrc

if [[ ! -d ~/templates ]]; then
    ln -s /usr/share/openstack-tripleo-heat-templates templates
fi

time openstack overcloud deploy --templates ~/templates \
     -e ~/templates/environments/docker.yaml \
     -e ~/templates/environments/low-memory-usage.yaml \
     -e ~/templates/environments/disable-telemetry.yaml \
     -e ~/docker_registry.yaml \
     --compute-scale 0 --control-scale 1 --ntp-server 10.5.26.10 \
     --stack control-plane
