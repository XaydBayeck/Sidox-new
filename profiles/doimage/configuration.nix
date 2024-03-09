{ nixpkgs, pkgs, ... }:

{
  imports = [
    ./basic.nix
  ];
  
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  services.cloud-init = {
    enable = true;
  };

  services.gns3-server = {
    enable = true;
    vpcs.enable = true;
    ubridge.enable = true;
    dynamips.enable = true;
    # auth = {
    #   enable = true;
    #   user = "gns3";
    #   passwordFile = "/run/secrets/gns3-server-password";
    # };
  };

  # virtualisation.libvirtd

  networking.firewall.allowedTCPPorts = [ 3080 ];

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtzxclUaXXDNMsGMXkRq3ZnpE7XIazMC5EWcXguGlkj sid@sixos"
    ];
    hashedPassword = 
      "$y$j9T$oA.oy3cXG2PAu8el2fKo7/$of0zJG0uB/uxh2sJdmj6m2UE4w0q4bGGLqfJAIip2a0";
  };

  # swapDevices = [{
  #   device = "/swap/swapfile";
  #   size = 1024 * 2; # 2 GB
  # }];

  environment.systemPackages = with pkgs; [
    libvirt
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" ];
    auto-optimise-store = true;
  };

  # environment.etc.nixpkgs.source = nixpkgs;
  nix.channel.enable = false;
  nix.registry.nixpkgs.flake = nixpkgs;
  nix.nixPath = [
    "nixpkgs=${nixpkgs}"
    "nixos-config=/nix/var/nix/profiles/per-user/root/channels/nixos"
  ];

  system.stateVersion = "23.11";
}
