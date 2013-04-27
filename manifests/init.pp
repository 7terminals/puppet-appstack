# Class: puppet-appstack
#
# The appstack module allows Puppet to setup a directory structure for hosting isolated applications.
# The following tree is created:
#
# * ~/apps   - Apps such as tomcat and ant
# * ~/hangar - Source code for deploymemt of code
# * ~/log    - Each application creates a directory in here and places its' logs in it
# * ~/www    - Webapp directory
# * ~/var    - PID files and spool files are placed here
# * ~/cron   - Each cron must create a directory here and run from inside it
# * ~/.ssh   - The .ssh directory for the user
#
# Parameters: user, group, ensure
#
# Sample Usage:
#    appstack::setup { 'example.com':
#       user   => 'example.com',
#       group  => 'example.com',
#       ensure => 'present'
#   }
#
class appstack {

}
