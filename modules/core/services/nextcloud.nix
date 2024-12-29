{pkgs, username, inputs, config, ... }: 
{
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
}
