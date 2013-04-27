appstack::setup { 'example.com':
  user   => 'example.com',
  group  => 'example.com',
  ensure => 'present'
}