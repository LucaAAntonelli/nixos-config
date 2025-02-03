{pkgs, username, inputs, config, lib, ... }: 
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "nextcloud.${inputs.secrets.domain}";
    config.adminuser = username;
    config.adminpassFile = config.sops.secrets.nextcloud-admin-pass.path;
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "16G";
    https = true;
    extraAppsEnable = true;
    extraApps = {
      inherit (pkgs.nextcloud30Packages.apps) onlyoffice;
    };
  };
}
