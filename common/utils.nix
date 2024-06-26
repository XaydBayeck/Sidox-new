{ pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

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
    clash-meta

    nix-output-monitor
    cachix
  ];

  environment.shells = with pkgs; [ fish nushell ];

  services.greenclip.enable = true;

  # programs.clash-verge = {
  #   enable = true;
  #   autoStart = true;
  #   tunMode = true;
  # };
}
