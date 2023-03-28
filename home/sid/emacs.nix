# nixos/home/sid/emacs.nix
{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.el;
      defaultInitFile = true;
      package = pkgs.emacsGit;

      extraEmacsPackages = epkgs: [ ];
    };
  };
}
