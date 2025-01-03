{ inputs, config, ... }:
{
  services.nginx = {
    enable = true;
    # recommendedGzipSettings = true;

    virtualHosts = {
      "192.168.1.212" = {
        listen = [
          {
            addr = "192.168.1.212";
            port = 8080;
          }
        ];
      };

      "bitwarden.${inputs.secrets.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
        };
      };

      "immich.${inputs.secrets.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.immich.port}";
          proxyWebsockets = true;
        };
      };
    };
  };
}
