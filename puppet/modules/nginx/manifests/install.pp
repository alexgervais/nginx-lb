class nginx::install {
  #exec { "apt-update":
  #   command     => "/usr/bin/apt-get update --fix-missing",
  #   refreshonly => false;
  #}
  package {
    'nginx':
      ensure => 'installed'
  }
}
