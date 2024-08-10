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

    keymaps = [
      {
        action = "<ESC>^i";
        key = "<C-b>";
        mode = "i";
        options.desc = "move beginning of line";
      } 
      {
        action = "<End>";
        key = "<C-e>";
        mode = "i";
        options.desc = "move end of line";
      }
      {
        action = "<Left>";
        key = "<C-h>";
        mode = "i";
        options.desc = "move left";
      }
      {
        action = "<Right>";
        key = "<C-l>";
        mode = "i";
        options.desc = "move right";
      }
      {
        action = "<Down>";
        key = "<C-j>";
        mode = "i";
        options.desc = "move down";
      }
      {
        action = "<Up>";
        key = "<C-k>";
        mode = "i";
        options.desc = "move up";
      }
      {
        action = "<cmd>noh<CR>";
        key = "<Esc>";
        mode = "n";
        options.desc = "general clear highlights";
      }
      {
        action = "<C-w>h";
        key = "<C-h>";
        mode = "n";
        options.desc = "switch window left";
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        mode = "n";
        options.desc = "switch window right";
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
        mode = "n";
        options.desc = "switch window down";
      }
      {
        action = "<C-w>k";
        key = "<C-k>";
        mode = "n";
        options.desc = "switch window up";
      }
      {
        action = "<cmd>w<CR>";
        key = "<C-s>";
        mode = "n";
        options.desc = "file save";
      }
      {
        action = "<cmd>%y+<CR>";
        key = "<C-c>";
        mode = "n";
        options.desc = "file copy whole";
      }
      {
        action = "<cmd>set nu!<CR>";
        key = "<leader n>";
        mode = "n";
        options.desc = "toggle line number";
      }
      {
        action = "<cmd>set rnu!<CR>";
        key = "<leader>rn";
        mode = "n";
        options.desc = "toggle relative number";
      }
      {
        action = "<cmd>NvCheatsheet<CR>";
        key = "<leader>ch";
        mode = "n";
        options.desc = "toggle nvcheatsheet";
      }
      {
        action = '' 
          function()
          require("conform").format {lsp_fallback=true}
          end
        '';
        key = "<leader>fm";
        mode = "n";
        options.desc = "format files";
      }
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    ];
  };
}
