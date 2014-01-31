
class users {
  user {'dpb':
    ensure => "present",
    managehome => true,
    groups => ["adm", "admin"],
  }

  file {"/home/dpb":
      source => "puppet:///modules/users/dpb",
      owner => "dpb",
      group => "dpb",
      recurse => true,
  }
}
