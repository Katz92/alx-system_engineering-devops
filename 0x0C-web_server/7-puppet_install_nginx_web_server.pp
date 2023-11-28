# Puppet manifest to install nginx
class { 'nginx':
  package_source => 'nginx-mainline',
  manage_repo    => true,
}

nginx::resource::server { 'default':
  listen_port => 80,
  www_root    => '/var/www/html',
  index_files => ['index.html'],
  use_default_location => false,

  location_cfg_append => {
    'return' => '301 /redirect_me',
  },

  location_raw_append => {
    '/' => [
      'location / {',
      '  return 200 "Hello World!";',
      '}',
    ],
  },
}

