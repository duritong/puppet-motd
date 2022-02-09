# manage dependencies for figlet
class motd::puppetmaster {

  # https://bugzilla.redhat.com/show_bug.cgi?id=2032196
  if versioncmp($facts['os']['release']['major'],'9') < 0 {
    package{'figlet':
      ensure => installed,
      before => File['/usr/local/bin/motd_gen.sh'],
    }
  }
  file{'/usr/local/bin/motd_gen.sh':
    source => 'puppet:///modules/motd/motd_gen.sh',
    owner  => root,
    group  => 0,
    mode   => '0755',
  }
}
