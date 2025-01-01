{pkgs, username, inputs, config, ... }: 
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "192.168.1.212";
    config.adminuser = username;
    config.adminpassFile = config.sops.secrets.nextcloud-admin-pass.path;
    database.createLocally = true;
    configureRedis = true;
    settings.trusted_domains = [ "nextcloud.${inputs.secrets.domain}" ];

  };
}
