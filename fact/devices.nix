{ pkgs, ... }:

{
  services = {
    udisks2.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      # xkbVariant = "";
      wacom.enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware.nvidia.open = true;
}
