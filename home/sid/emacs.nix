# nixos/home/sid/emacs.nix
{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.org;
      defaultInitFile = true;
      package = pkgs.emacsGit;

      extraEmacsPackages = epkgs: [ ];
    };
  };
}
