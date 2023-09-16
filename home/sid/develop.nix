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
    # rust-analyzer
    # haskell-language-server
    # sumneko-lua-language-server
    nil
    nixpkgs-fmt
    nixfmt
    typst-lsp
    libvterm

    helix
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-gtk3;
    extraPackages = epkgs: with epkgs; [
      async
      minions
      doom-modeline
      doom-themes
      ligature
      all-the-icons
      org-modern
      org-appear
      olivetti
      aio
      xenops
      corfu
      kind-icon
      cape
      vertico
      vertico-posframe
      orderless
      consult
      consult-eglot
      marginalia
      embark
      embark-consult
      tempel
      tempel-collection
      eglot-tempel
      sly
      geiser-guile
      #geiser-chez
      #geiser-racket
      haskell-mode
      nix-mode
      # nix-ts-mode
      ob-nix
      magit
      treesit-auto
      rainbow-delimiters
      hl-todo
      treemacs
      treemacs-magit
      treemacs-icons-dired
      popper
      eldoc-box
      meow
      sideline
      sideline-flymake
      flymake-elisp-config
      org-roam
      consult-org-roam
      vterm
      direnv
      dashboard
      markdown-mode
      treesit-grammars.with-all-grammars
      ];
  };
}
