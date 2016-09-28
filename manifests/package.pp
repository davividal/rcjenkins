class jenkins::package($java = 'java-1.8.0-openjdk') {
  if ($osfamily == 'rhel') {
    yumrepo { 'jenkins':
      ensure => present,
      baseurl => 'http://pkg.jenkins-ci.org/redhat',
      enabled => true,
      gpgcheck => true,
      gpgkey => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
    }

    package { 'jenkins':
      ensure => present,
      require => Yumrepo['jenkins']
    }
  }

  package { $java:
    ensure => present
  }
}