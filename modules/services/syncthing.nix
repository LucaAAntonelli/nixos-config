{ ... }: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];

    settings.gui = {
      user = "myuser";
      password = "mypassword";
    };
  };
}
