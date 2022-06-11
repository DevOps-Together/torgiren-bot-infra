# Infra for bot

## Prerequisites 
Required installed software:
* Python 3
* vagrant 
* Vagrant compatible virtualization engine, for example: VirtualBox
## Setup project locally
### Setup vm using vagrant
1. `cd vagrant`
1. `vagrant up`
### Setup ansible
1. `cd ansible`
1. (setup once) `python3 -m venv .ansible_env`
1. . .ansible_env/bin/activate
1. (setup once) `pip3 install -r requirements.txt`

## Installation
1. `ansible-playbook install_rke2.yaml`

## Cleanup
1. `cd vagrant && vagrant destroy`
