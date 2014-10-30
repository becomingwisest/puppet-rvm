class rvm::dependencies {
  exec{'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3':} ->
  case $::operatingsystem {
    Ubuntu,Debian: { require rvm::dependencies::ubuntu }
    CentOS,RedHat,Amazon: { require rvm::dependencies::centos }
    OracleLinux,RedHat: { require rvm::dependencies::oraclelinux }
  }
}
