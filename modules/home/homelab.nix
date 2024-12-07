{ username, ... }: 
{
  imports = [
    ./bat.nix
    ./nixvim
    ./tmux.nix
    ./starship.nix
    ./zsh.nix
    ./git.nix
  ];
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
