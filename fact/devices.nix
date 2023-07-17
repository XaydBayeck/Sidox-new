{ pkgs, ... }:

{
  services = {
    myudisks2.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      # xkbVariant = "";
      libinput.enable = true;
      wacom.enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware.nvidia.open = true;
}
