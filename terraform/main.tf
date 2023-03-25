terraform {
    required_providers {
        libvirt = {
            source = "dmacvicar/libvirt"
        }
    }
    required_version = ">= 0.12"
}

provider "libvirt" {
    uri = "${var.libvirt_uri}"
}

resource "libvirt_volume" "master_disk" {
    name = "${var.name_disk}"
    source = var.base_volume_name == null ? var.source_images : null
    base_volume_name = var.base_volume_name != null ? var.base_volume_name : null
    format = "qcow2"
}

data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
    vars = {
        shell = var.shell
        ssh_keys = var.ssh_keys
        groups = var.groups
        hostname = var.hostname
        username = var.username
    }
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
    vars = {
        ip_address = var.ip_address
        gateway = var.gateway
    }
}


resource "libvirt_cloudinit_disk" "common_init" {
    name = "common_init.iso"
    user_data = data.template_file.user_data.rendered
    network_config = data.template_file.network_config.rendered
}



resource "libvirt_domain" "default" {
    name = var.name
    description = "Terraform Devops"
    network_interface {
       network_name =  "default"
    }
    cpu {
        mode = "host-passthrough"
    }
    qemu_agent = true
    memory = var.vm_memory
    vcpu = var.vm_cpu
    disk {
        volume_id = libvirt_volume.master_disk.id
        scsi = "true"
    }
    cloudinit = libvirt_cloudinit_disk.common_init.id
}
