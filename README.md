# Packer Testing Example

## Overview
This repo shows example of how to use testing when building a packer image

## Packer
We are using AMIs that are built using Hashicorp Packer that uses Ansible to provision the image.

The Ansible playbook is located within `packer/playbooks`

### Testing
The playbook has related integration tests that can be found within `packer/playbooks/test/integration/default/serverspec`

These tests can be run using [Test Kitchen](http://kitchen.ci/) that utilises an Ubuntu 16.04 Docker image. See below for relevant commands and expected output:

```
# change to relvant directory from repo root
cd playbooks

# Install relevant ruby gems to run Test Kitchen
bundle install # may require root

# set up test environment and provision using Ansible 
kitchen converge

# Run Serverspec test suite
kitchen verify

## Expected output from kitchen verify:
-----> Starting Kitchen (v1.16.0)
           ...OUTPUT CUT...
       Finished in 0.21901 seconds (files took 0.27641 seconds to load)
       14 examples, 0 failures

       Finished verifying <default-ubuntu-1604> (0m5.81s).
-----> Kitchen is finished. (0m5.89s)

# Clean up test environment
kitchen destroy
```

### Caveats
- Only able to run on Ubuntu 16.04
- Expect machine to have Docker, Ansible and Ruby installed

## TODO
- Improve testing of Packer image after it has been created

## LICENSE
MIT
