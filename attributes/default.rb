default['securian-apache']['webroot'] = '/data/websites'
default['securian-apache']['logroot'] = '/data/logs'
default['securian-apache']['apache-user'] = 'apache'
default['securian-apache']['apache-group'] = 'apache'
default['securian-apache']['sites']['mysite'] = { 'port' => 80 }
default['securian-apache']['sites']['othersite'] = { 'port' => 81 }
