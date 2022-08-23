variable "hostname" {
  description = "Hostname" 
  type = string 
  default = "goodbit_host" 
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

variable "username" { 
  description = "username vm" 
  type = string
  default = "goodbit22"
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