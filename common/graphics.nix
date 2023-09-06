{ pkgs, ... }:

{
  services.xserver.windowManager.leftwm.enable = true;

  fonts.packages = with pkgs; [
    dejavu_fonts # Basic beautiful fonts
    nerdfonts # Programe ligrature fonts
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
    symbola # for unicode
  ];

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
}
