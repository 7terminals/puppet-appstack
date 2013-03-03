define appstack::setup ($user, $group) {
  file { "/home/${user}/apps":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '644',
  }

  file { "/home/${user}/hangar":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '644',
  }

  file { "/home/${user}/log":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '644',
  }

  file { "/home/${user}/www":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '644',
  }

  file { "/home/${user}/cron":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '644',
  }
    file { "/home/${user}/.ssh":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '700',
  }
}