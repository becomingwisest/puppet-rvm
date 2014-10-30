class rvm($version='latest', $install_rvm=true) {
  stage { 'rvm-install': before => Stage['main'] }

  if $install_rvm {
    exec{'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3':} ->
    class {
      'rvm::dependencies': stage => 'rvm-install';
      'rvm::system':       stage => 'rvm-install', version => $version;
    }
  }
}
