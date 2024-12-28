{ pkgs, host, username, config, inputs, ... }: 
{
  imports = [
    ./sops.nix
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

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "nextcloud.${inputs.secrets.domain}";
    config.adminuser = username;
    config.adminpassFile = config.sops.secrets.nextcloud-admin-pass.path;
    database.createLocally = true;
    configureRedis = true;
    https = true;

  };

  services.vaultwarden = {
    enable = true;
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
    };
  };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;

    virtualHosts = {
      "nextcloud.${inputs.secrets.domain}" = {
        forceSSL = true;
        enableACME = true;
      };
      "bitwarden.${inputs.secrets.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://${toString config.services.vaultwarden.config.ROCKET_ADDRESS}:${toString config.services.vaultwarden.config.ROCKET_PORT}";
        };
      };
    };
  };

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

  # Enable fail2ban to prevent DDOS attacks
  services.fail2ban = {
    enable = true;
    ignoreIP = [
      "192.168.1.189/24"
      "192.168.1.158/24"
      "192.168.1.225/24"
      "100.112.125.65"
      "100.92.240.23"
      "100.70.195.51"
    ];
    extraPackages = [ pkgs.ipset ];  
    banaction = "iptables-ipset-proto6-allports";  
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
    allowSFTP = true;
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
 
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
