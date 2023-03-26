{ pkgs,... }:

{
  home.packages = with pkgs; [
    zathura
    crow-translate
    flameshot
    screenkey
    pcmanfm

    gh

    rofi
    polybar
    feh
    picom-jonaburg
    trayer
    libnotify

    tdesktop
    element-desktop
    discord

    wget2
    curl
    w3m
    nyxt
    aria
    clash
  ];

  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      mpris
    ];
  };

  services = {
    udiskie.enable = true;
  };
}