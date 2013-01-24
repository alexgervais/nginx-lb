include iptables::disable
include nginx

nginx::config::cluster{'loadbalancing':
  servers => [
    '192.168.1.104:8880',
    '192.168.1.104:8881',
  ]
}
nginx::config::vhost{
  'lb2.local':
    cluster => 'loadbalancing',
}
