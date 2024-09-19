{ ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Luca";
    userEmail = "luca.antonelli@gmx.ch";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
      core.editor = "nvim";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
