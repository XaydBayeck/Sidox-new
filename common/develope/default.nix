{ pkgs, ... }:

let
  embedded = pkgs.stdenv.mkDerivation {
    name = "embedded-udev-rules";

    src = ./rules/.;

    dontBuild = true;
    dontConfig = true;

    installPhase = ''
      mkdir -p $out/etc/udev/rules.d
      cp 70-st-link.rules $out/etc/udev/rules.d
      cp 99-microbit.rules $out/etc/udev/rules.d
      cp 99-hid.rules $out/etc/udev/rules.d
    '';
  };
in
{
  services.udev.packages = [ embedded ];

  environment.variables = {
    EDITOR = "hx";
  };

    virtualisation.libvirtd.enable = true;
}
