{ pkgs,... }:

{
  home.packages = with pkgs; [
    zathura
    crow-translate
    flameshot
    screenkey
    pcmanfm
    xarchive

    gh

    rofi
    polybar
    feh
    picom-jonaburg
    trayer
    libnotify

    tdesktop
    element-desktop

    wget2
    curl
    w3m
    nyxt
    ranger
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
