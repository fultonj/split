#!/usr/bin/env bash

source ~/stackrc

if [[ ! -d ~/templates ]]; then
    ln -s /usr/share/openstack-tripleo-heat-templates templates
fi

openstack overcloud deploy --templates ~/templates \
	  -r compute_only_roles_data.yaml \
	  -e ~/templates/environments/docker.yaml \
	  -e ~/templates/environments/low-memory-usage.yaml \
	  -e ~/templates/environments/disable-telemetry.yaml \
	  -e ~/docker_registry.yaml \
	  -e endpoint.yaml \
	  -e extra_hosts.yaml \
	  --stack compute0
