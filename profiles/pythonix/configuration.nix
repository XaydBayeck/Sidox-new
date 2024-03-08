{ pkgs, config,... }:

{
  imports = [
    ../../common/utils.nix
    ../../common/locale.nix
  ];

  # << Boot and Virtualizations >>

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.vmVariant.virtualisation = {
    memorySize = 2048;
    cores = 3;
  };

  # system.build.vm = config.system.build.virtualBoxOVA;

  # << User configurations >>

  programs.fish.enable = true;

  users.users.alice = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "vboxusers"];
    initialPassword = "pythondev";
    shell = pkgs.fish;
  };

  home-manager.users.alice = import ./alice.nix;

  # << Network >>
 
  networking = {
    hostName = "alice"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://127.0.0.1:7890/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

  # << Graphics >>
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.defaultSession = "xfce";
  };

  fonts.packages = with pkgs; [
    dejavu_fonts # Basic beautiful fonts
    nerdfonts # Programe ligrature fonts
    fira-code # as up
    powerline-fonts # cool fonts mainly used on vim ui
    # google-fonts # must need
    wqy_zenhei # Chinese
    wqy_microhei # Chinese
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-emoji # 😃
    # emacs-all-the-icons-fonts
    lxgw-wenkai
    symbola # for unicode
  ];

  fonts.fontDir.enable = true;

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.serif = [
    "DejaVu Serif"
  ];
  fonts.fontconfig.defaultFonts.sansSerif = [
    "DejaVu Sans"
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "DejaVu Sans Mono"
  ];

  # << Nix Configurations >>

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "alice" ];
    auto-optimise-store = true;
  };

  # nix.channel.enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11";
}
