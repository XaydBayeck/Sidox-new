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
  # environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
  nix.nixPath = [
    "nixpkgs=${nixpkgs}"
    "nixos-config=/nix/var/nix/profiles/per-user/root/channels/nixos"
  ];
}
