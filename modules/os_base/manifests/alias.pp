class os_base::alias {
  file { 'alias.sh':
    path   => '/etc/profile.d/alias.sh',
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/os_base/alias.sh',
  }
}
