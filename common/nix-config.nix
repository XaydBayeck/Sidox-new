{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    #substituters = [
    #  "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    #];
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "sid" ];
    auto-optimise-store = true;
  };
}
