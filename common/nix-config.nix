{ lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
  ];

  nix.settings = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "sid" ];
    auto-optimise-store = true;
  };
}
