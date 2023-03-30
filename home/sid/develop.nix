{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    guile_3_0
    chez
    sbcl
    # NOTE: Language Servers
    rust-analyzer
    haskell-language-server
    sumneko-lua-language-server
    nil
    clang-tools
  ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs:
      let
        config = with epkgs; [
          use-package
        ];
        appearance = with epkgs; [
          epkgs.doom-modeline
          doom-themes
          dashboard
          rainbow-mode
          rainbow-delimiters
          highlight-indent-guides
        ];
        operate = with epkgs; [
          meow
          which-key
        ];
        company = with epkgs; [
          vertico
          orderless
          marginalia
          embark
          consult
          embark-consult
        ];
        corfu = with epkgs;[
          corfu
          corfu-doc
          kind-icon
          cape
        ];
        edit = with epkgs;[
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
        manager = with epkgs;[
          treemacs
          projectile
          magit
        ];
        dependencies = with epkgs;[
          posframe
        ];
      in
      appearance
      ++ operate
      ++ config
      ++ company
      ++ corfu
      ++ edit
      ++ manager
      ++ dependencies
    ;
  };
}
