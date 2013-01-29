include iptables::disable
include nginx

nginx::config::cluster{'loadbalancing':
  servers => [
    '192.168.1.104:8880',
    '192.168.1.104:8881',
  ]
}
nginx::config::vhost{
  'lb1.local':
    cluster => 'loadbalancing',
}
 
file {
  '/etc/udev/rules.d/70-persistent-net.rules':
    ensure => absent
}
