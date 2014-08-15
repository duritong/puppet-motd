# manage dependencies for figlet
class motd::puppetmaster {
  package{'figlet':
    ensure => installed,
  } -> file{'/usr/local/bin/motd_gen.sh':
    source  => 'puppet:///modules/motd/motd_gen.sh',
    owner   => root,
    group   => 0,
    mode    => '0755';
  }
}
