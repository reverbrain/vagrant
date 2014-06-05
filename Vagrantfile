#
# 2014+ Copyright (c) Anton Tiurin <noxiouz@yandex.ru>
# All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#

Vagrant.configure("2") do |config|
    config.vm.define "Elliptics"

    config.vm.box = "precise64-elliptics"
    config.vm.box_url = "http://repo.reverbrain.com/vagrant-base/precise64-docker.box"

    # forward dnet_ioserv port
    config.vm.network :forwarded_port, guest: 1025, host: 1025
    # forward rift port
    config.vm.network :forwarded_port, guest: 8080, host: 8080

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    config.vm.provision "file",
        source: "repo.reverbrain.list",
        destination: "~/repo.reverbrain.list"

    config.vm.provision "file",
        source: "ioserv.json",
        destination: "~/ioserv.json"

    config.vm.provision "file",
        source: "server-config.json",
        destination: "~/server-config.json"

    config.vm.provision "shell",
        path: "install.sh"

end
