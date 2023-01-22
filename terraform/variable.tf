variable "libvirt_uri"{
  description = "Libvirt Uri"
  type = string
  default  = "qemu:///system"
}

variable "type_network" {
  description = "Type of network"
  type = string 
  default = "route"
}

variable "name_interface" {
  description = "Name interface"
  type = string 
  default = "good_net"
}

variable "ip_address" {
  description = "ip address"
  type = string
  default = "192.168.0.120/24"
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
  default = "Centos9_stream_master"
}

variable "source_images" {
  description = "url image"
  type = string
  default = "https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-20210830.0.x86_64.qcow2"
}

variable "skip_network"{
  type = number
  default = 0
}

# CLOUD INIT VARIABLES

variable "username" { 
  description = "username vm" 
  type = string
  default = "goodbit22"
}

variable "hostname" {
  description = "Hostname" 
  type = string 
  default = "goodbit_host" 
}

variable "shell" {
  type = string 
  default = "/bin/bash" 
}