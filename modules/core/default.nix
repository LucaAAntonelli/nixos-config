{ inputs, nixpkgs, self, username, config, ...}:
let 
  host = config.host;
in
{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./fonts.nix
    ./steam.nix
    ./nix-helper.nix
  ];
}
