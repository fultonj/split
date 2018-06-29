# Split Stack Experiments

Prototype of a TripleO [Split Controlplane](https://specs.openstack.org/openstack/tripleo-specs/specs/rocky/split-controlplane.html) deployment.

## External Compute

1. Deploy a single controller node with [deploy-control-plane.sh](deploy-control-plane.sh)
2. Extract control plane information that an "external" compute node would need with [create-compute-stack-env.sh](create-compute-stack-env.sh)
3. Deploy an "external" compute node with a separate heat stack [deploy-compute.sh](deploy-compute.sh)

Based [examples](https://review.openstack.org/#/q/topic:compute_only_stack2+(status:open+OR+status:merged)) from shardy.
