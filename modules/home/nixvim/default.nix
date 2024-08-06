{ inputs, ... }: {

  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
       };
}