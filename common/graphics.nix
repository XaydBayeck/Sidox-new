{ pkgs, ... }:

let
    nerdfonts # Programe ligrature fonts
    = with pkgs.nerd-fonts; [
      iosevka
      iosevka-term
      agave
      jetbrains-mono
      fira-code
      hack
      hasklug
      caskaydia-cove
      caskaydia-mono
      code-new-roman
      hurmit
      monoid
      dejavu-sans-mono
      zed-mono
      noto
    ];
in {
  services.xserver.windowManager.leftwm.enable = true;

  fonts.packages = with pkgs; [
    dejavu_fonts # Basic beautiful fonts
    fira-code # as up
    powerline-fonts # cool fonts mainly used on vim ui
    # google-fonts # must need
    wqy_zenhei # Chinese
    wqy_microhei # Chinese
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-emoji # 😃
    # emacs-all-the-icons-fonts
    lxgw-wenkai
    #symbola # for unicode
    bqn386
  ] ++ nerdfonts;

  fonts.fontDir.enable = true;

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.serif = [
    "DejaVu Serif"
  ];
  fonts.fontconfig.defaultFonts.sansSerif = [
    "DejaVu Sans"
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "DejaVu Sans Mono"
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      oo7
    ];
    config.common = {
      default = ["gtk"];
      "org.freedesktop.impl.portal.Secret" = [
        "oo7"
      ];
    };
  };
}
