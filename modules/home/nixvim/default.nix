{ inputs, ... }: {

  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    colorschemes.gruvbox.enable = true;
    opts = {
    	number = true;
    	shiftwidth = 4;
	
	clipboard = "unnamedplus";
    };   
  };
}
