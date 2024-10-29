{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zathura
    crow-translate
    flameshot
    screenkey
    pcmanfm
    #xarchive
    file-roller

    gh
    networkmanagerapplet

    rofi
    polybar
    feh
    picom
    trayer
    libnotify

    tdesktop
    element-desktop

    rnote
    zk

    wget2
    curl
    w3m
    yazi
    aria

    eww

    libreoffice
    lutris
    idris2
    idris2Packages.idris2Lsp
    rlwrap
    inetutils
    prismlauncher
    gamemode
    vulkan-tools
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
    dunst = {
      enable = true;
      iconTheme = {
        name = "Tela Red Dark";
        package = pkgs.tela-icon-theme;
      };
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          frame_color = "#ed6f71";
          font = "DejaVu Sans 9";
        };

        urgency_normal = {
          background = "#37474f";
          foreground = "#efcf71";
          timeout = 10;
        };
      };
    };
  };

  # systemd.user.services.clash = {
  #   Unit = {
  #     Description = "Auto start clash";
  #     After = ["network.target"];
  #   };
  #   Install = {
  #     WantedBy = ["default.target"];
  #   };
  #   Service = {
  #     ExecStart = "${pkgs.clash.outPath}/bin/clash";
  #   };
  # };
}
