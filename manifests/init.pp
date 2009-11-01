#
# motd module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# include motd::puppetmaster on the 
# master before you to any motd::client
# calls. 
# content and generate functions
# are evaluated on the master!
# you can pass additional messages by
# setting $motd_message to some string
#

# modules_dir { "motd": }

class motd { }

class motd::client {
    include ibp::opt::bin
    file{"/etc/motd":
        content => generate("/opt/bin/motd_gen.sh", "${hostname}", "${motd_message}"),
        owner => root, group => 0, mode => 0644;
    } 
}

class motd::puppetmaster {
    package{figlet:
        ensure => installed,
        before => File["/etc/motd"],
    }

    file{"/opt/bin/motd_gen.sh":
        source => "puppet://$server/modules/motd/motd_gen.sh",
        before => File["/etc/motd"],
        require => [ Package[figlet], File["/opt/bin"] ],
        owner => puppet, group => 0, mode => 0755;
    }
}
