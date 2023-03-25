{ pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # boot.loader.grub = {
  #   enable = true;
  #   device = "nodev";
  #   efiSupport = true;
  #   extraEntries = ''
  #     menuentry "Arch Linux" {
  #       search -set=archlinux --fs-uuid 8789-9B75
  #       configfile "($archlinux)/boot/grub/grub.cfg
  #     }
  #   '';
  # };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.supportedFilesystems = [ "exfat" "ntfs" ];
}
