{ pkgs, ... }:
{
  home.packages = (with pkgs; [ swaynotificationcenter ]);
  xdg.configFile."swaync/style.css".source = ./gruvbox-dark.css;
  xdg.configFile."swaync/config.json".source = ./config.json;
}