{ pkgs, host, username, inputs, ... }: 
{
  imports = [
    ./sops.nix
    ./services/nginx.nix
    ./services/immich.nix
    ./services/fail2ban.nix
    ./services/nextcloud.nix
    ./services/vaultwarden.nix
    ./services/cloudflared.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking= {
    hostName = "${host}";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Zurich";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Add zsh program here too
  programs.zsh.enable = true;

  environment.systemPackages = [ pkgs.tailscale ];

  services.tailscale.enable = true;

  security.acme = {
    defaults.email = inputs.secrets.email;
    acceptTerms = true;
  };

# Enable automatic login for the user.
  services.getty.autologinUser = username;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
    allowSFTP = true;
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 80 443 2283 8080 8222 8888];
 
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
