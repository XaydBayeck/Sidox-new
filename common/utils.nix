{ pkgs, ... }:

{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    xclip
    xorg.xmodmap
    usbutils
    gparted
    tldr
    httpie
    rar
    unar
    zip
    unzip
    p7zip
    ripgrep
    fd
    bottom
    tree
    hyfetch
    parted
  ];

  environment.shells = with pkgs; [ fish nushell ];
}
