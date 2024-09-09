{ inputs, pkgs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./keybinds.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    colorschemes.gruvbox = {
      enable = true;
    };
    extraConfigLuaPre = ''
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    '';
    extraConfigLua = ''
      vim.opt.whichwrap:append("<>[]hl")
    '';
    globals = {
      mapleader = " ";
    };
    opts = {
    	number = true;
    	shiftwidth = 2;
	    clipboard = "unnamedplus";
      laststatus = 3;
      showmode = false;
      cursorline = true;
      cursorlineopt = "number";

      expandtab = true;
      smartindent = true;
      tabstop = 2;
      softtabstop = 2;
      ignorecase = true;
      smartcase = true;
      mouse = "a";
      numberwidth = 2;
      ruler = false;
      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      timeoutlen = 400;
      undofile = true;
      updatetime = 250;
      wrap = false;
    };  
  };
}
