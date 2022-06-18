Role Name
=========

The role installs rke2_server on Centos8 systems

Requirements
------------


Role Variables
--------------

kubectl_path - location  kubectl 
kubeconfig_path - location  kubeconfig
token_location - location  node token
yum_path - location repositories yum 

Dependencies
------------


Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

GPL-2.0

Author Information
------------------

https://github.com/goodbit22
https://gitlab.com/goodbit22
