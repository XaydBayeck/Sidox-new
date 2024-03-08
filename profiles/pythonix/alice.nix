{ pkgs, config, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  # << Appearence >>
  
  gtk = with pkgs; {
    enable = true;
    cursorTheme = {
      package = nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
    theme = {
      package = plata-theme;
      # name = "Plata-Red-Noir-Compact";
      name = "Plata-Noir";
    };
    iconTheme = {
      package = tela-icon-theme;
      name = "Tela Red Dark";
    };
    gtk2.extraConfig = ''
      gtk-button-images=0
      gtk-menu-images=0
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
      gtk-toolbar-style="GTK_TOOLBAR_BOTH_HORIZ"
      gtk-toolbar-icon-size="GTK_ICON_SIZE_LARGE_TOOLBAR"
    '';
    gtk3.extraConfig = {
      gtk-button-images = 0;
      gtk-menu-images = 0;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.pointerCursor = {
    package = pkgs.nordzy-cursor-theme;
    gtk.enable = true;
    name = "Nordzy-cursors";
    x11.enable = true;
    x11.defaultCursor = "Nordzy-cursors";
  };
  
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # << Shell Configuraitons >>

  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.75;
          padding = {
            x = 10;
            y = 10;
          };
        };
        font = {
          normal = {
            family = "Hurmit Nerd Font";
            style = "Regular";
          };
          size = 12;
        };
        colors = {
          primary = {
            background = "0x2b3339";
            foreground = "0xd8caac";
          };

          normal = {
            black = "0x090618";
            red = "0xc34043";
            green = "0x76946a";
            yellow = "0xc0a36e";
            blue = "0x7e9cd8";
            magenta = "0x957fb8";
            cyan = "0x6a9589";
            white = "0xc8c093";
          };
          bright = {
            black = "0x727169";
            red = "0xe82424";
            green = "0x98bb6c";
            yellow = "0xe6c384";
            blue = "0x7fb4ca";
            magenta = "0x938aa9";
            cyan = "0x7aa89f";
            white = "0xdcd7ba";
          };

          selection = {
            background = "0x2d4f67";
            foreground = "0xc8c093";
          };
        };
      };
    };
    fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        # {
        #   name = "grc";
        #   src = grc.src;
        # }
        {
          name = "bass";
          src = bass.src;
        }
        {
          name = "puffer";
          src = puffer.src;
        }
        {
          name = "pisces";
          src = pisces.src;
        }
        {
          name = "forgit";
          src = forgit.src;
        }
      ];
      shellAliases = {
        es = "eza";
        el = "eza -l";
        ea = "eza -la";
        et = "eza -lt";
      };
    };
    eza = {
      enable = true;
      enableAliases = false;
      git = true;
      icons = true;
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batpipe
        batgrep
        batwatch
        prettybat
      ];
    };
    nushell = {
      enable = true;
      # package = pkgs.nushell.override { additionalFeatures = (p: p ++ ["dataframe"]); };
      package = pkgs.nushellFull;
      configFile.source = ./config.nu;
      extraConfig = ''
        $env.NU_LIB_DIRS = [
          '${config.home.homeDirectory}/.config/nushell/scripts'
        ]
      '';
      extraEnv = ''
        $env.FORGIT = ${pkgs.fishPlugins.forgit}/share/fish/vendor_conf.d/bin/git-forgit
      '';
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
    broot = {
      enable = true;
      enableFishIntegration = true;
      settings.modal = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;

    };
    git = {
      enable = true;
      delta.enable = true;
      # userEmail = "SydBayeck@outlook.com";
      # userName = "Sid";
    };
    direnv = {
      enable = true;
      # enableFishIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
  };

  # << Develop >>
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xsession.enable = true;
}
