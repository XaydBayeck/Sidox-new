{ pkgs, ... }:

{
  services = {
    udisks2.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us,apl";
        variant = ",dyalog";
        options = "grp:toggle,terminate:ctrl_alt_bksp";
      };
      wacom.enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware.nvidia.open = true;
}
