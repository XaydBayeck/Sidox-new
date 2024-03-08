{ nixpkgs, ... }:

{
  imports = [
    ./configuration.nix
  ];
  
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  environment.etc.nixpkgs.source = nixpkgs;

  services.cloud-init = {
    enable = true;
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtzxclUaXXDNMsGMXkRq3ZnpE7XIazMC5EWcXguGlkj sid@sixos"
    ];
    hashedPassword = 
      "$y$j9T$oA.oy3cXG2PAu8el2fKo7/$of0zJG0uB/uxh2sJdmj6m2UE4w0q4bGGLqfJAIip2a0";
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 1024 * 2; # 2 GB
  }];

  # virtualisation.digitalOceanImage.compressionMethod = "bzip2";

  system.stateVersion = "23.11";
}
