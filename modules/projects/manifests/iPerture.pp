class projects::iPerture {
  include virtualbox
  include vagrant

  boxen::project { 'iPerture':
    source  => "rtircher/iPerture",
  }
}
