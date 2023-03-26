{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    # gulie_3_0
    # NOTE: Language Servers
    rust-analyzer
    haskell-language-server
    sumneko-lua-language-server
    nil
    clang-tools
  ];
}
