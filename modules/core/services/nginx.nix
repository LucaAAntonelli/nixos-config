{ inputs, config, ... }:
{
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
}
