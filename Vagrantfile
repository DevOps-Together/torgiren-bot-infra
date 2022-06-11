# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
require 'json'
machines_vag = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'machines_vagrant.json')))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	machines_vag.each do |machines|
		config.vm.define machines['name']  do |mav|
			mav.vm.box = machines['box']
			mav.vm.provider :virtualbox do |vb|
				vb.name = machines['name']
				vb.memory = machines['ram']
			end
			if Vagrant.has_plugin?("vagrant-vbguest") then
				config.vbguest.auto_update = false
			end
		end
	end
end