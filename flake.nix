{
  description = "Luca Antonelli's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
  
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
  
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  
    nix-gaming.url = "github:fufexan/nix-gaming";
  
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    book-app.url = "github:LucaAAntonelli/book-app";
  };

  outputs = { nixpkgs, self, home-manager, ...} @ inputs:
  let
    username = "luca";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/desktop) ];
        specialArgs = { host = "desktop"; inherit self inputs username ; };
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/laptop) ];
        specialArgs = { host = "laptop"; inherit self inputs username ; };
      };
      homelab = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/homelab) ];
        specialArgs = { host = "homelab"; inherit self inputs username ;};
      };
    };

    homeConfigurations = {
      "${username}@laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./modules/home ];
        extraSpecialArgs = { host = "laptop"; inherit self inputs username; };
      };

      "${username}@desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./modules/home ];
        extraSpecialArgs = { host = "desktop"; inherit self inputs username; };
      };
      "${username}@homelab" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./modules/home/homelab.nix ];
        extraSpecialArgs = { host = "homelab"; inherit self inputs username; };
      };
    };
  };
}
