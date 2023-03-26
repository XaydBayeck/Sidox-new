{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    # gulie_3_0
  ];
}
