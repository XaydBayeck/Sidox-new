{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ sqlite ];
  programs = {
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
