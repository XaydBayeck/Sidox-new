{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    gulie_3_0
    chez
    # NOTE: Language Servers
    rust-analyzer
    haskell-language-server
    sumneko-lua-language-server
    nil
    clang-tools
  ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs;
    let
      config = [
        use-package
      ];
      appearance = [
        doom-themes
        doom-modline
        dashboard
        rainbow-mode
        rainbow-delimiters
        highlight-indent-guides
      ];
      operate = [
        meow
        which-key
      ];
      company = [
        vertico
        orderless
        marginalia
        embark
        consult
        embark-consult
      ];
      corfu = [
        corfu
        corfu-doc
        kind-icon
        cape
      ];
      edit = [
        tree-sitter
        tree-sitter-langs
        flycheck
        eglot
        flycheck-eglot
        geiser
        geiser-guile
        geiser-chez
        macrostep-geiser
        sly
        parinfer-rust-mode
        smartparens
        yasnippet
        yasnippet-snippets
      ];
      manager = [
        treemacs
        projectile
        magit
      ];
      dependencies = [
        posframe
      ];
    in builtins.concatLists [
      appearance
      operate
      config
      company
      corfu
      edit
      manager
      dependencies
    ];
  };
}
