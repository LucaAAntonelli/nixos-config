{pkgs, username, inputs, config, lib, ... }: 
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
    # settings.max_chunk_size = 50000000;
    # phpOptions = {
    #   max_chunk_size = 50000000;
    #   memory_limit = lib.mkForce "512M";
    #   upload_max_size = "16G";
    #   post_max_size = "16G";
    # };
    maxUploadSize = "16G";
    https = true;
  };
}
