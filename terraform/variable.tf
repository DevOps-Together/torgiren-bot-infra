variable "libvirt_uri"{
  description = "Libvirt Uri"
  type = string
  default  = "qemu:///system"
}

variable "name" {
  type = string 
  default = "goodbit22_vm"
}

variable "vm_memory" {
    description = "amount of memory" 
    type = number 
    default = 4096
    validation {
        condition = var.vm_memory >= 2048
        error_message = "Must be 2048 or more."
    }
}

variable "vm_cpu" { 
  description = "Number of cpus" 
  type = number 
  default = 2 
  validation {
    condition = var.vm_cpu >= 1
    error_message = "Must be 1 or more."
  }
}

variable "name_disk" {
  type = string
  default = "Centos8_stream_master"
}

variable "source_images" {
  description = "url image"
  type = string
  default = "https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20230308.3.x86_64.qcow2"
}



# CLOUD INIT VARIABLES

variable "shell" {
  type = string 
  default = "/bin/bash" 
}

variable "groups" {
  description = "user groups"
  type = string
  default = "wheel"
}

variable "ssh_keys" {
  description = "SSH keys" 
  type = string 
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClePKrWjz5n/0zF13gjx/10c2rv0Y4bHRiYkl7crHvqRZ9wcL429wcAACe+klUEogseavmMcAiOOqIcZJvj5wY9Ok630UU75LtCgbWCMosrWXxov7WLv46GAw9Pm5OVTXci99M6kgsoRhNOLPRbyvK6jATEPShVXj0putzOYnfWeGRLqahBYr7+gORoZ2lWaO8/CbyoJ/beaiGi0oGHMZZxbjgTo65omfMCYkf85Y5nnltGUT2HnSv10GaPoKJt41E70+G+AZAYK32BNEqJzS2kgrNee4XseGCyHOXZN0EXy3bQSFm0MyVaSa7hoqQFzvNf5bLpwHF5IYTmfGpXDKXRlq/v9FZ96mOmxZRUk5nPPPq6WoIX0GV8KzxtifMSwkS3xdQdgBz0QHpUSoZ/Css+udG80gEhZltZeE8f9wBmcSZGKjG6BfdR4dFyv74NQ2ttC8CB9JlAzUa2Z1DcngshFU2nOtuHrSwI58dzKCHY0d1qJdol3McWeWW1W7QV4k= goodbit22@goodbit22-82b"
}

variable "hostname" {
  description = "Hostname" 
  type = string 
  default = "devops" 
}


# CLOUD INIT NETWORK VARIABLES

variable "ip_address" {
  description = "ip address"
  type = string
  default = "192.168.122.201/24"
}

variable "gateway" {
  description = "gateway"
  type = string
  default = "192.168.122.1"
}

variable "username" {
  description = "default user username"
  type = string
  default = "admin"
}
