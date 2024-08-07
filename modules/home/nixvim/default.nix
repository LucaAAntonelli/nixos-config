{ inputs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim 
    ./plugins.nix
  ];

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
