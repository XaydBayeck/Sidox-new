{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    guile_3_0
    chez
    sbcl
    julia-bin
    # NOTE: Language Servers
    rust-analyzer
    haskell-language-server
    sumneko-lua-language-server
    nil
    clang-tools
  ];

  programs.emacs = {
    enable = true;
  };
}
