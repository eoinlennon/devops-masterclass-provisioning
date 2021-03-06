class setup::bamboo {

  class { 'bamboo':
    tomcat_port  => '9697',
    installdir   => '/opt/bamboo',
    homedir      => '/var/local/bamboo',
    java_home    => '/usr/',
    user         => 'bamboo',
  }

  nginx::resource::server { 'bamboo.extremeautomation.io':
    listen_port => 80,
    proxy       => 'http://localhost:9697',
  }

}