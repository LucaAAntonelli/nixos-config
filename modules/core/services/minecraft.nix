{ pkgs, lib, inputs, ... }:
let
  modpack = (pkgs.fetchPackwizModpack {
    url = "https://github.com/Misterio77/Modpack/raw/0.2.9/pack.toml";
    packHash = "sha256-7ZiGTMjLi60jE94lNIlAGpAMPOOuPdO5H+VhvE0LEU4=";
  });
in
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    # package = pkgs.minecraftServers.vanilla-1-12;
    dataDir = "/var/lib/minecraft/server";

    servers = {
      cool-server = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_18_2;

        serverProperties = { };
        whitelist = { };

        symlinks = {
          "mods" = "${modpack}/mods";
        };
      };
    };
  };
}
