appstack
====


Overview
--------

The appstack module sets up a directory structure for hosting isolated applications.


Module Description
-------------------

The appstack module allows Puppet to setup a directory structure for hosting isolated applications.
The following tree is created:

* ~/apps   - Applications such as tomcat and ant are intended to be deplpyed in this directory
* ~/hangar - Directory to checkout and build code
* ~/log    - Applications are expected to be configured to log in this directory
* ~/www    - Exploded WAR to be deployed here
* ~/var    - Applications are expected to be configured to put their PID and spool files here
* ~/cron   - Each cron must create a directory here and run from inside it
* ~/.ssh   - The .ssh directory for the user


Setup
-----

**What appstack affects:**

* The user's home directory structure
	
### Beginning with appstack

To setup the initial directory structure

    appstack::setup { 'example.com-home':
      ensure => 'present',
      user   => 'example.com',
      group  => 'example.com'
    }

Usage
------

The `appstack::setup` resource definition has three parameters which are mandatory.

**Parameters within `appstack`**

####`ensure`

This parameter specifies whether the directory structure should be created or not.
Valid arguments are 'present' or 'absent'. Default is present

####`user`

This parameter is used to set the permissions for the directory tree.

####`group`

This parameter is used to set the permissions for the directory tree.


Limitations
------------

This module has been built and tested using Puppet 2.6.x, 2.7, and 3.x.

The module has been tested on:

* CentOS 5.9
* CentOS 6.4
* Debian 6.0 
* Ubuntu 12.04

Testing on other platforms has been light and cannot be guaranteed. 

Development
------------

Bug Reports
-----------

Release Notes
--------------

**0.0.1**

First initial release.
