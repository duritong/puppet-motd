class motd::client($message = '') {
  file{"/etc/motd":
    content => generate("/usr/local/bin/motd_gen.sh", $::hostname, $message),
    owner   => root,
    group   => 0,
    mode    => '0644';
  }
}
