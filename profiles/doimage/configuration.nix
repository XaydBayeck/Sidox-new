{ ... }:

{
  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.grub.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
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
