
class users {
  user {'dpb':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
    groups => ["sudo"],
    password => '$6$yHOWuyY1$PkwUJoWz0WpmLf3wzsna626Zya6KH6GrAXtw0IIFmazZDWwt.lOaF3Fp86OdH0Y7l/Tvc2/ayV4l5/Hb7RoB/0',
  }

  file {"/home/dpb":
      source => "puppet:///modules/users/dpb",
      owner => "dpb",
      group => "dpb",
      recurse => true,
  }
}
