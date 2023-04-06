{ pkgs, ... }:

{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    
    xclip
    xorg.xmodmap
    usbutils
    gparted
    tldr
    httpie
    rar
    unar
    zip
    zstd
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

  services.greenclip.enable = true;
}
