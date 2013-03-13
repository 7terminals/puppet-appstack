# Define appstack::setup
# Sets up a directory structure for hosting isolated applications
# ~/apps - JDk, Tomcat, Ant etc
# ~/hangar - source code
# ~/log - each application created a folder in here and places its logs in it
# ~/www - webapp directory
# ~/var - pid files, spool files etc
# ~/cron - each cron must create a directory here and run from inside it
# ~/.ssh - .ssh directory for the user

define appstack::setup ($user, $group) {
  File {
    ensure => directory,
    owner  => $user,
    group  => $group,
  }

  file { "/home/${user}/apps": mode => '644', }

  file { "/home/${user}/hangar": mode => '644', }

  file { "/home/${user}/log": mode => '644', }

  file { "/home/${user}/www": mode => '644', }

  file { ["/home/${user}/var", "/home/${user}/var/run", "/home/${user}/var/spool"]: mode => '644', }

  file { "/home/${user}/cron": mode => '644', }

  file { "/home/${user}/.ssh": mode => '700', }
}