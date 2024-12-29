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

  services.immich = {
    enable = true;
    port = 2283;
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;

    virtualHosts = {
      "nextcloud.${inputs.secrets.domain}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          access_log /var/log/nginx/nextcloud.access.log;
          error_log /var/log/nginx/nextcloud.error.log;
        '';
      };

      "bitwarden.${inputs.secrets.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://${toString config.services.vaultwarden.config.ROCKET_ADDRESS}:${toString config.services.vaultwarden.config.ROCKET_PORT}";
        };
        extraConfig = ''
          access_log /var/log/nginx/bitwarden.access.log;
          error_log /var/log/nginx/bitwarden.error.log;
        '';
      };

      "immich.${inputs.secrets.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://[::1]:${toString config.services.immich.port}";
          proxyWebsockets = true;
        };
        extraConfig = ''
          access_log /var/log/nginx/immich.access.log;
          error_log /var/log/nginx/immich.error.log;
        '';
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

  # Set up fail2ban jails and filters
  environment.etc = {
    "fail2ban/filter.d/molly.conf".text = ''
      [Definition]
      failregex = <HOST>\s+(31|40|51|53).*$
    '';

    "fail2ban/filter.d/nginx-bruteforce.conf".text = ''
      [Definition]
      failregex = ^<HOST>.*GET.*(matrix/server|\.php|admin|wp\-).* HTTP/\d.\d\" 404.*$
    '';

    "fail2ban/filter.d/postfix-bruteforce.conf".text = ''
      [Definition]
      failregex = warning: [\w\.\-]+\[<HOST>\]: SASL LOGIN authentication failed.*$
      journalmatch = _SYSTEMD_UNIT=postfix.service
    '';
  };


  # Enable fail2ban to prevent DDOS attacks
  services.fail2ban = {
    enable = true;
    extraPackages = [ pkgs.ipset ];  
    banaction = "iptables-ipset-proto6-allports";
    jails = {
      # max 6 failures in 600 seconds
    "nginx-spam" = ''
      enabled  = true
      filter   = nginx-bruteforce
      logpath = /var/log/nginx/access.log
      backend = auto
      maxretry = 6
      findtime = 600
    '';

    # max 3 failures in 600 seconds
    "postfix-bruteforce" = ''
      enabled = true
      filter = postfix-bruteforce
      findtime = 600
      maxretry = 3
    '';

    # max 10 failures in 600 seconds
    # "molly" = ''
    #   enabled = true
    #   filter = molly
    #   findtime = 600
    #   maxretry = 10
    #   logpath = /var/log/molly-brown/access.log
    #   backend = auto
    # '';
  };

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
