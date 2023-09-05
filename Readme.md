# Sid's NixOS

## Used inputs

- nixpkgs
- sinur
- home-manager
<!-- - emacs-overlay -->

## Fiels structure
```
.
├── common -------- Common system softwares or configed better in sysconfig
│   ├── default.nix
│   ├── graphics.nix ----- windowManager and fonts
│   ├── locale.nix ------- input method, time and local settings
│   ├── media.nix -------- audio and firefox
│   ├── nix-config.nix --- config nix package manager
│   └── utils.nix -------- various softwares no need to config and shell can be use
├── fact ---------- settings about physics machine
│   ├── default.nix
│   ├── boot.nix --------- the way to booot system
│   ├── devices.nix ------ which device your machine links ?
│   └── network.nix ------ ethernet or wireless and firewall ?
├── flake.nix
├── home ---------- user configurations
│   ├── sid -------- the main user
│   │   ├── default.nix
│   │   ├── appearance.nix ---- gtk and qt and cursor
│   │   ├── basic.nix --------- basic home-manager configuration
│   │   ├── common.nix -------- various softwares
│   │   ├── develop.nix ------- daily use code environment softwares
│   │   └── shell.nix --------- shell settings and various utils terminal softwares
│   └── sid.nix ---------- system user
├── overlays ------ overlays
│   └── teaks.nix -------- a little changes
└── profiles ------ systems
    └── sixos ----- main system see https://nixos.org
        ├── configuration.nix
        └── hardware-config.nix
```

## Top modules

### profiles

#### sixos

modules:
- hardware-config.nix
- common
- fact
- home/sid.nix

### common

#### graphics

- leftwm
- fonts
- fontconfig

#### locale

- inputMethod
- time
- locale

#### media

- sound
- pulseaudio
- mediaKeys
- firefox

- packages:
  - pavucontrol
  - paprefs
  - pasystray

#### utils

- dconf
- greenclip

- packages:
  - xclip
  - xmodmap
  - usbutils
  - gparted
  - tldr
  - httpie
  - rar
  - unar
  - zip
  - unzip
  - p7zip
  - ripgrep
  - fd
  - bottom
  - tree
  - hyfetch
  - parted

### fact

#### boot

- boot.loader
- kernelPackages
- supportedFilesystems

#### devices

- udisks2
- libinput
- wacom
- videoDrivers

#### network

- proxy
- networkmanager
- bluetooth
- ssh

### overlays


## home modules

### appearance

- packages:
  - nordzy-cursor-theme
  - plata-theme
  - tela-icon-theme

- gtk
- qt
- pointerCursor

### develop

- packages:
  - ghc

### shell

- packages:
  - sqlite
- shells:
  - fish:
    - bass
    - puffer
    - pisces
    - forgit
- exa
- bat
- zoxide
- broot
- fzf
- git
- direnv
- starship

### common

packages:
- app:
  - zathura
  - crow-translate
  - flameshot
  - screenkey
  - pcmanfm
  - nyxt
  - communicates:
    - tdesktop
    - element-desktop
    - discord
- desktop environment:
  - rofi
  - polybar
  - feh
  - picom-jonaburg
  - trayer
  - libnotify
- terminal:
  - wget2
  - curl
  - w3m
  - aria
  - clash
