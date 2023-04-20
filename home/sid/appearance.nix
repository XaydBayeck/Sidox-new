{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nordzy-cursor-theme
    plata-theme
    tela-icon-theme
    # sinur.fcitx5-nord
  ];

  gtk = with pkgs; {
    enable = true;
    cursorTheme = {
      package = nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
    theme = {
      package = plata-theme;
      # name = "Plata-Red-Noir-Compact";
      name = "Plata-Noir";
    };
    iconTheme = {
      package = tela-icon-theme;
      name = "Tela Red Dark";
    };
    gtk2.extraConfig = ''
      gtk-button-images=0
      gtk-menu-images=0
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
      gtk-toolbar-style="GTK_TOOLBAR_BOTH_HORIZ"
      gtk-toolbar-icon-size="GTK_ICON_SIZE_LARGE_TOOLBAR"
    '';
    gtk3.extraConfig = {
      gtk-button-images = 0;
      gtk-menu-images = 0;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.pointerCursor = {
    package = pkgs.nordzy-cursor-theme;
    gtk.enable = true;
    name = "Nordzy-cursors";
    x11.enable = true;
    x11.defaultCursor = "Nordzy-cursors";
  };
}
