{inputs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Luca";
    userEmail = inputs.secrets.email;
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
      core.editor = "nvim";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
