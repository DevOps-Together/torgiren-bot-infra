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
    source = "${var.source_images}"
}

resource "libvirt_network" "network_machine" {
    name = "${var.name_interface}"
    mode = "${var.type_network}"
    addresses = ["${var.ip_address}"]
    dhcp {
      enabled = false
    }
    count = var.skip_network == "false" ? 0 : 1
}

resource "libvirt_cloudinit_disk" "common_init" {
    name = "common_init.iso"
    user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
    vars = {
        username = var.username
        hostname = var.hostname
        shell = var.shell
    }
}




resource "libvirt_domain" "default" {
    name = var.name
    #description = "Wstepna vm dla kvm"
    network_interface {
       network_id = "default"
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
    cloudinit = "${libvirt_cloudinit_disk.common_init.id}"
}

# output "ip" {
#   value = "${libvirt_domain.default.network_interface.0.addresses.0}"
# }
