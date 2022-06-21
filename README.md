# Description
A configuration that creates two virtual machines using Vagrant and automatically installs rke2-server and rke2-agent using Ansible

## Prerequisites
Required installed software:
* vagrant 
* Virtualbox
* Python3  
* virtualenv package

## Setup

### Setup Ansible
1. `cd ansible`
2. (setup once) `virtualenv -p python3 .ansible_env`
3. `source .ansible_env/bin/activate`
4. (setup once) `pip3 install -r requirements.txt`

### Setup vms using vagrant 
1. `cd vagrant`
2. `vagrant up`

## Cleanup

###  Delete vms using vagrant
1. `cd vagrant`
2. `vagrant destroy -f`

### Delete Ansible virtualenv 
1. `rm -r .ansible_env`
