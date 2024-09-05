{ pkgs, inputs, ... }: 
{
  programs.firefox = {
    enable = true;
    package = pkgs.floorp;

    profiles.luca = {
      
      id = 0;
      name = "luca";
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        duckduckgo-privacy-essentials
        reddit-enhancement-suite
      ];

    };
  };
}
