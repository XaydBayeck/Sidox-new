{ pkgs, ... }:

{
  users.users.sid = {
    isNormalUser = true;
    description = "sid";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    shell = pkgs.fish;
  };

  home-manager.users.sid = import ./sid;
}
