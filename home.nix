{pkgs, ...}: 

{
  home.username = "luca";
  home.homeDirectory = "/home/luca";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
