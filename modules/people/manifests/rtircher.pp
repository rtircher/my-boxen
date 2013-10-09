class people::rtircher {
  include emacs
  include firefox
  include java
  include flux    # how to configure it?
  include sublime_text_2
  include dropbox # how to configure it?
  include adium   # how to configure it?
  include virtualbox
  # include vmware_fusion
  include slate
  include emacs
  include cyberduck
  include transmission
  include zsh
  include handbrake
  include caffeine
  include vlc
  include alfred  # how to configure it?

  # include osx


  # Chrome setup
  # from the stable channel
  include chrome
  # from the nightly channel
  include chrome::canary


  # Vagrant setup
  include vagrant
  # vagrant::plugin { 'vagrant-vmware-fusion':
  #   license => 'puppet:///modules/people/joe/licenses/fusion.lic',
  # }

  # vagrant::box { 'squeeze64/vmware_fusion':
  #   source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  # }

  
  # Personal setup
  include projects::all

  $home           = "/Users/${::luser}"
  $my             = "${home}/Development"
  $dotfiles       = "${my}/dot-files"
  $emacs_dotfiles = "${my}/emacs-dotfiles"
  $github_user    = "rtircher"

  file { "$my":
    ensure => 'directory',
  }

  # need to do the all symlink stuff???
  repository { $dotfiles:
    source  => "${github_user}/dot-files",
    require => File[$my]
  }

  exec { 'setup-dotfiles':
    command => "${dotfiles}/setup.sh",
    require => Repository[$dotfiles],
  }

  # need to do the all symlink stuff???
  repository { $emacs_dotfiles:
    source  => "${github_user}/emacs-dotfiles",
    require => File[$my]
  }

}
