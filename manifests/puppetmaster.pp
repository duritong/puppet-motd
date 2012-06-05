class motd::puppetmaster {
  package{figlet:
    ensure => installed,
    before => File["/etc/motd"],
  }

  file{"/opt/bin/motd_gen.sh":
    source => "puppet:///modules/motd/motd_gen.sh",
    before => File["/etc/motd"],
    require => [ Package[figlet], File["/opt/bin"] ],
    owner => puppet, group => 0, mode => 0755;
  }
}
