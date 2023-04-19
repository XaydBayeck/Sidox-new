{ pkgs, ... }:

{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty

    xclip
    xorg.xmodmap
    usbutils
    gparted
    tealdeer
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

    nix-output-monitor
  ];

  environment.shells = with pkgs; [ fish nushell ];

  services.greenclip.enable = true;
}
