{ pkgs, ... }:

{
  home.packages = with pkgs; [
    guile
    chez
    sbcl
    julia-bin
    typst
    # NOTE: Language Servers
    # rust-analyzer
    # haskell-language-server
    # sumneko-lua-language-server
    nixd
    nixpkgs-fmt
    nixfmt-classic
    tinymist
    libvterm

    helix

    opera
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs30;
    extraPackages = epkgs: with epkgs; [
      ebnf-mode
      async
      minions
      doom-modeline
      doom-themes
      ligature
      all-the-icons
      nerd-icons
      org-modern
      org-appear
      olivetti
      #aio
      #xenops
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
      geiser-chez
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
      org-roam-ui
      consult-org-roam
      vterm
      direnv
      dashboard
      markdown-mode
      idris-mode
      idris2-mode
      rust-mode
      rustic
      proof-general
      treesit-grammars.with-all-grammars
      ];
    overrides = final: prev: {
      eglot = null;
    };
  };
}
