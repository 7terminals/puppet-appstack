define appstack::setup (
  $user   = undef,
  $group  = undef,
  $ensure = 'present') {
  # we support only Debian and RedHat
  case $::osfamily {
    Debian  : { $supported = true }
    RedHat  : { $supported = true }
    default : { fail("The ${module_name} module is not supported on ${::osfamily} based systems") }
  }

  # validate parameters
  if ($user == undef) {
    fail('user parameter must be set')
  }

  if ($group == undef) {
    fail('group parameter must be set')
  }

  if !($ensure in ['absent', 'present']) {
    fail('ensure parameter must be either absent or present')
  }

  if ($ensure == 'present') {
    File {
      ensure => directory,
      owner  => $user,
      group  => $group,
    }

    file { "/home/${user}/apps":
      mode => '644',
    }

    file { "/home/${user}/hangar":
      mode => '644',
    }

    file { "/home/${user}/log":
      mode => '644',
    }

    file { "/home/${user}/www":
      mode => '644',
    }

    file { ["/home/${user}/var", "/home/${user}/var/run", "/home/${user}/var/spool"]:
      mode => '644',
    }

    file { "/home/${user}/cron":
      mode => '644',
    }

    file { "/home/${user}/.ssh":
      mode => '700',
    }
  } else {
    # delete all modifications done
    file { ["/home/${user}/apps", "/home/${user}/hangar", "/home/${user}/log", "/home/${user}/www"]:
      ensure  => 'absent',
      recurse => true,
      force   => true,
    }

    file { ["/home/${user}/var", "/home/${user}/var/run", "/home/${user}/var/spool"]:
      ensure  => 'absent',
      recurse => true,
      force   => true,
    }

    file { ["/home/${user}/cron", "/home/${user}/.ssh"]:
      ensure  => 'absent',
      recurse => true,
      force   => true,
    }
  }

}