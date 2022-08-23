terraform {
    required_providers {
        libvirt = {
            source = "dmacvicar/libvirt"
        }
    }
    required_version = ">= 0.12"
}

provider "libvirt" {
    uri = "qemu:///system"
}


resource "libvirt_volume" "master_disk" {
    name = "Centos9_stream_master"
    source = "https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-20210830.0.x86_64.qcow2"
   
}

resource "libvirt_network" "network_machine" {
    name = "${var.name_interface}"
    mode = "${var.type_network}"
    addresses = ["192.168.0.120/24"]
}

resource "libvirt_cloudinit_disk" "common_init" {
    name = "common_init.iso"
    user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
    template = file("cloud_init.cfg")
}

resource "libvirt_domain" "default" {
    name = var.name
    description = "Wstepna vm dla kvm"
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

