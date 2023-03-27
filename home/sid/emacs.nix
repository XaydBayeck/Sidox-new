{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.el;
      defaultInitFile = true;
      package = pkgs.emacs;

      extraEmacsPackages = epkgs: [ ];
    };
  };
}
