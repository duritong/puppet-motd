class motd::client {
    include ibp::opt::bin
    file{"/etc/motd":
        content => generate("/opt/bin/motd_gen.sh", "${hostname}", "${motd_message}"),
        owner => root, group => 0, mode => 0644;
    }
}
