# Description #

This is the repo for deploying a Sputnik demo.

This repository contains the roles, environments and data bags for deploying an Sputnik laptop demonstration application.

# Dependencies #

The `infrastructure.yml`, `laptop.yml` and `openstack.yml` manifests use spiceweasel or sputnik-cloudlauncher.

```
gem install sputnik-cloudlauncher
```

# Demo #

1.  deploy the Chef infrastructure dependencies with `sputnik init infrastructure.yml`
1.  launch the demo application on the Dell OpenStack cluster with `sputnik launch -c dell-openstack.rb dell-openstack.yml`
1.  knife search for Dell OpenStack
1.  Connect to the Dell `haproxy` node on port 22002 to see the web UI console.
1.  Connect to the Dell `haproxy` node on port 80 to see the `demo-app`, refresh a couple of times.

1.  launch the demo application on the Rackspace OpenStack cluster with `sputnik launch -c rs-openstack.rb rs-openstack.yml`
1.  knife search for Rackspace OpenStack
1.  Connect to the Rackspace `haproxy` node on port 22002 to see the web UI console.
1.  Connect to the Rackspace `haproxy` node on port 80 to see the `demo-app`, refresh a couple of times.

1.  Bump up the version number of the `demo-app` cookbook in the `metadata.rb`.
1.  Make a change to the `demo-app` cookbook.
1.  upload the changes with `sputnik init infrastructure.yml`

1.  refresh the Dell nodes with
1.  knife ssh "recipe:demo-app AND chef_environment:sputnik" "chef-client"
1.  Connect to the Dell `haproxy` node on port 80 to see the `demo-app`, refresh a couple of times.

1.  Connect to the Rackspace `haproxy` node on port 80 to see the `demo-app`, refresh a couple of times. Verify it is not updated.

1.  refresh the Rackspace nodes with
1.  knife ssh "recipe:demo-app AND chef_environment:sputnik" "chef-client"


# TODO #
1. sputnik destroy
1. sputnik refresh
1. Put LXC in there to show off the Sputnik laptop.
1. Version pinning with environments.

# Chef infrastructure #

## Roles ##

### base ###

Recipes for every machine deployed. Attempts to use `apt::cacher-client`.

### sputnik-base ###

Sets up the Sputnik laptop with `lxc` and `apt-cacher-ng` (for use by the lxc VMs).

### haproxy ###

The demo application sits behind the software load balancer `haproxy`.

## Cookbooks ##

With the exception of the `demo-app` cookbook, the cookbooks used by this repository are all

### demo-app ###

Trivial html page behind `apache2` that renders the names of the machines to demonstrate the `haproxy` integration.

# License #

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

