{ inputs, ... }: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];
    user = "luca";
    configDir =
      "/home/luca/.config/syncthing"; # set to somewhere in home directory to have access with user

    settings = {
      devices = {
        "Desktop-Windows" = { id = inputs.secrets.syncthing-ids.windows; };
        "Phone" = { id = inputs.secrets.syncthing-ids.phone; };
      };
      folders = {
        "Library" = {
          path = "/home/luca/library";
          devices = [ "Desktop-Windows" ];
        };
        "Audibooks" = {
          path = "/home/luca/audiobooks";
          devices = [ "Desktop-Windows" ];
        };
      };
    };
  };
}
