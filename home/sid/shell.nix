{ pkgs, ... }:

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
    # nushell = {
    #   enable = true;
    # };
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
