{ lib, pkgs, ... }:

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
    clash-nyanpasu
    (makeAutostartItem {
      name = "clash-nyanpasu";
      package = clash-nyanpasu;
    })

    nix-output-monitor
    cachix
  ];

  environment.shells = with pkgs; [ fish nushell ];

  services.greenclip.enable = true;

  # security.wrappers.clash-nyanpasu = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_net_bind_service,cap_net_admin=+ep";
  #   source = "${lib.getExe pkgs.clash-nyanpasu}";
  # };
}
