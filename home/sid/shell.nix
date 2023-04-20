{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ sqlite ];
  programs = {
    wezterm = {
      enable = true;
    };
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
    };
    exa = {
      enable = true;
      enableAliases = true;
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
      configFile.source = ./config.nu;
      extraConfig = ''
        let-env NU_LIB_DIRS = [
          '${config.home.homeDirectory}/.config/nushell/scripts'
        ]

        if ('${config.home.homeDirectory}/.config/nushell/custom.nu' | path exists) {
          use ${config.home.homeDirectory}/.config/nushell/custom.nu *
        }
      '';
      # let
      #   scripts = "${pkgs.nu_scripts}";
      # in
      #     # \'${home.homeDirectory}/.config/nushell/scripts\'
      #  ''
      #   let-env NU_LIB_DIRS = [
      #     '${scripts}'
      #   ]
      #   # Custom Completions
      #   use ${scripts}/custom_completions/git/git-completions.nu *
      #   use ${scripts}/custom_completions/nix/nix-completions.nu *
      #   use ${scripts}/custom_completions/cargo/cargo-completions.nu *
      #   use ${scripts}/custom_completions/btm/btm-completions.nu *
      #   use ${scripts}/custom_completions/make/make-completions.nu *
      # '';
      extraEnv = ''
        let-env FORGIT = ${pkgs.fishPlugins.forgit}/share/fish/vendor_conf.d/bin/git-forgit
      '';
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
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
      userEmail = "SydBayeck@outlook.com";
      userName = "Sid";
    };
    direnv = {
      enable = true;
      #enableFishIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
