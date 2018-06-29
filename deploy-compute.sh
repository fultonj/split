#!/usr/bin/env bash

source ~/stackrc

if [[ ! -d ~/templates ]]; then
    ln -s /usr/share/openstack-tripleo-heat-templates templates
fi

openstack overcloud deploy --templates ~/templates \
	  -r compute_only_roles_data.yaml \
	  -e endpoint.yaml \
	  -e extra_hosts.yaml \
	  --stack compute0
