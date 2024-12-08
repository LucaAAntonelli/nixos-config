{ host, username, ... }: 
{
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
  };

# Enable automatic login for the user.
  services.getty.autologinUser = "luca";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];


  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
    passwordAuthentication = true;
    allowSFTP = true;
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
