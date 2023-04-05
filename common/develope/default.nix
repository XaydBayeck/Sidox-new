{ pkgs, ... }:

let
  stlink = pkgs.stdenv.mkDerivation {
    name = "stlink-udev-rules";

    src = ./rules/.;

    dontBuild = true;
    dontConfig = true;

    installPhase = ''
      mkdir -p $out/etc/udev/rules.d
      cp 70-st-link.rules $out/etc/udev/rules.d
    '';
  };
in
{
  services.udev.packages = [ stlink ];
}
