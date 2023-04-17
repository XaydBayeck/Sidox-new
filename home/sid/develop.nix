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
    nixpkgs-fmt
    nixfmt
    typst-lsp
    clang-tools
    libvterm
    helix
  ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [ vterm ];
  };
}
