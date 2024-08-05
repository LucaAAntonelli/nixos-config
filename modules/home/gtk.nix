{ pkgs, config, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })
    pkgs.twemoji-color-font
    pkgs.noto-fonts-emoji
    pkgs.gruvbox-dark-icons-gtk
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 22;
  };

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
  };
  
}
