
class sudoers {
  file {"/etc/sudoers.d/sudo-dpb":
      source => "puppet:///modules/sudoers/sudo-dpb",
      owner => "root",
      group => "root",
  }
}
