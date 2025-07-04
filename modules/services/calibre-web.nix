{pkgs, ... }: 
  let
    calibre-web-with-kobo = pkgs.calibre-web.overridePythonAttrs (oldAttrs: {
      dependencies = oldAttrs.dependencies ++ [ pkgs.calibre-web.optional-dependencies.kobo];
      });
  in 
  {
  services.calibre-web = {
    enable = true;
    package = calibre-web-with-kobo;
    options.enableBookUploading = true;
    options.enableKepubify = true;
    listen = {
      ip = "192.168.1.212";
      port = 8083;
    };

  };
}
