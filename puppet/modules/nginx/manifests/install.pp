class nginx::install {
 
  common::line { 'debian_package':
    file => '/etc/apt/sources.list',
    line => 'deb http://backports.debian.org/debian-backports squeeze-backports main';
  }
 
  exec { 'apt-update':
    command     => '/usr/bin/apt-get update --fix-missing',
    refreshonly => false;
  }
 
  package { 'nginx/squeeze-backports':
    ensure => installed,
    require => Exec['apt-update'];
  }
}
