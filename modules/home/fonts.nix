{ pkgs, lib, ... }:

let
  opentypeFonts = with pkgs; [
  ];
  truetypeFonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "Noto"
      ];
    })
  ];
  notoFonts = with pkgs; [
  ];

  fonts = opentypeFonts ++ truetypeFonts ++ notoFonts;

  mkFontPath =
    fonts:
    map (font: {
      ".local/share/fonts/nixos/${lib.getName font}" = {
        source = "${font}/share/fonts/";
        recursive = true;
      };
    }) fonts;
in

{
  # Install fonts system-wide
  fonts.packages = fonts;

  # Link fonts to "~/.local/share/fonts/nixos"
  home-manager.users.kuroko = {
    home.file = lib.mergeAttrsList (mkFontPath fonts);
  };
}
