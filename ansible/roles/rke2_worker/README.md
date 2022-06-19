Role Name
=========

The role installs rke-agent on Centos8 systems

Requirements
------------

Role Variables
--------------

* kubeconfig_path - location  kubeconfig 
* token_location - location  node token 

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

https://gitlab.com/goodbit22
https://github.com/goodbit22
