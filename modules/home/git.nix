{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Luca";
    userEmail = "luca.antonelli@gmx.ch";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
