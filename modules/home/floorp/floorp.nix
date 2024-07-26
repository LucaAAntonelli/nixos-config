{ pkgs, username, ... }: 
{
  programs.firefox = {
    enable = true;
    package = pkgs.floorp;

#    profiles = {
 #     default = {
  #      id = 0;
   #     name = "luca";
    #    isDefault = true;
     #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          # nordpass
      #    ublock-origin
       # ];
#      };
 #   };
  };
}
