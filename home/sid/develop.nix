{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    guile_3_0
    chez
    sbcl
    julia-bin
    typst
    # NOTE: Language Servers
    rust-analyzer
    haskell-language-server
    sumneko-lua-language-server
    nil
    typst-lsp
    clang-tools
    libvterm
  ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [ vterm ];
  };
}
