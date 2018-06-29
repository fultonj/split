#!/bin/bash

STACK=control-plane

openstack stack output show $STACK EndpointMap --format yaml  | grep -A 1000 output_value | sed "s/^/ /" | sed "1s/^/parameter_defaults:\n EndpointMapOverride:\n/" | sed "/output_value/d" > endpoint.yaml

openstack stack output show $STACK HostsEntry | grep controller | sed "s/|//g" | sed "s/^ */ - /" | sed "1s/^/parameter_defaults:\n ExtraHostFileEntries:\n/" > extra_hosts.yaml

openstack overcloud roles generate --roles-path templates/roles -o compute_only_roles_data.yaml Compute

openstack overcloud deploy --templates templates --stack compute1 -r compute_only_roles_data.yaml -e endpoint.yaml -e extra_hosts.yaml
