class jenkins {
  include jenkins::package

  class { 'nginx': }
}
