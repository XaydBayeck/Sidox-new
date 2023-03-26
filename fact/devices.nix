{ ... }:

{
  services = {
    udisks2.enable = true;
    xserver = {
      layout = "us";
      # xkbVariant = "";
      libinput.enable = true;
      wacom.enable = true;
      # videoDrivers = [ "nvidia" ];
    };
  };

  # hardware.nvidia.open = true;
}
