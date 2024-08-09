{ inputs, pkgs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim 
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
    plugins = {
      bufferline.enable = true;
      oil.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree.enable = true;
      gitsigns.enable = true;
      cmp.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      indent-blankline.enable = true;
      friendly-snippets.enable = true;
      luasnip.enable = true;
      which-key.enable = true;     
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      nvim-lspconfig
      mason-nvim
    ];
  };
}
