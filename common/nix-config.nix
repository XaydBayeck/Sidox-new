{ lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "sid" ];
    auto-optimise-store = true;
  };

  nix.channel.enable = false;
  nix.registry.nixpkgs.flake = nixpkgs;
  environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
}
