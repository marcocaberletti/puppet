class zabbix::server inherits zabbix {
  $sql_server = 'rd-xeon-05.cnaf.infn.it'
  $db_name    = 'zabbix'
  $db_user    = 'zabbix'
  $db_pass    = 'zabbix'

  package { 'zabbix-sender': ensure => latest }

  package { 'zabbix-server': ensure => latest }

  package { 'zabbix-server-mysql': ensure => latest }

  package { 'zabbix-web': ensure => latest }

  package { 'zabbix-web-mysql': ensure => latest }

  package { 'zabbix-get': ensure => latest }

  package { 'httpd': ensure => latest }

  service { 'zabbix-server':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/zabbix-server restart',
    require => Package['zabbix-server'],
  }

  service { 'httpd':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/httpd restart',
    require => Package['httpd'],
  }

  file { 'zabbix_server.conf':
    ensure  => present,
    path    => '/etc/zabbix/zabbix_server.conf',
    require => Package['zabbix-server'],
    owner   => root,
    group   => $zabbix::params::zabbix_group,
    mode    => '0640',
    content => template('zabbix/zabbix_server.conf.erb'),
    notify  => Service['zabbix-server'],
  }

  file { 'zabbix.conf.php':
    ensure  => present,
    path    => '/etc/zabbix/web/zabbix.conf.php',
    require => Package['zabbix-web'],
    owner   => apache,
    group   => apache,
    mode    => '0644',
    content => template('zabbix/zabbix.conf.php.erb'),
    notify  => Service['httpd'],
  }

  file { 'zabbix.conf':
    ensure  => present,
    path    => '/etc/httpd/conf.d/zabbix.conf',
    require => Package['zabbix-web'],
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/zabbix/zabbix.conf',
    notify  => Service['httpd']
  }

  file { 'zabbix-backup.cron':
    ensure  => present,
    path    => '/etc/cron.daily/zabbix-backup.cron',
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('zabbix/zabbix-backup.cron.erb'),
  }

}
