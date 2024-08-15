{ inputs, pkgs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim 
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    colorschemes.gruvbox.enable = true;
    files = {
      "functions.lua" = {
        opts = {
          expandtab = true;
        };
      };
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
	    clipboard = {
        providers.wl-copy.enable = true;
      };
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
    plugins = {
      bufferline.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree = {
        enable = true;
        disableNetrw = true;
        respectBufCwd = true;
        syncRootWithCwd = true;
        openOnSetup = true;
        updateFocusedFile = {
          enable = true;
          updateRoot = true;
        };
        diagnostics.enable = true;
      };
      gitsigns.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      indent-blankline.enable = true;
      friendly-snippets.enable = true;
      cmp.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lua.enable = true;
      which-key.enable = true;     
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      cmp-nvim-lsp
      mason-nvim
      conform-nvim
    ];

    keymaps = [
      {
        action = ''function()
            require("functions").greet()
          end
        '';
        key = "<C-*>";
        mode = "n";
        options.desc = "import function testing";
      }

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
        options.desc = "General Format files";
      }
      {
        action = "vim.diagnostic.setloclist";
        key = "<leader>ds";
        mode = "n";
        options.desc = "LSP Diagnostic loclist";
      }
      {
        action = "<cmd>enew<CR>";
        key = "<leader>b";
        mode = "n";
        options.desc = "buffer new";
      }
      {
        action = "<cmd>BufferLineCycleNext<CR>";
        key = "<TAB>";
        mode = "n";
        options.desc = "buffer goto next";
      }
      {
        action = "<cmd>BufferLineCyclePrev<CR>";
        key = "<S-TAB>";
        mode = "n";
        options.desc = "buffer goto prev";
      }
      {
        action = "<cmd>bdelete<cr>";
        key = "<leader>x";
        mode = "n";
        options.desc = "buffer close";
      }
      {
        action = "gcc";
        key = "<leader>/";
        mode = "n";
        options = {
          desc = "Toggle Comment";
          remap = true;
        };
      }
      {
        action = "gc";
        key = "<leader>/";
        mode = "v";
        options = {
          desc = "Toggle Comment";
          remap = true;
        };
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<C-n>";
        mode = "n";
        options.desc = "nvimtree toggle window";
      }
      {
        action = "<cmd>NvimTreeFocus<CR>";
        key = "<leader>e";
        mode = "n";
        options.desc = "nvimtree focus window";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
        mode = "n";
        options.desc = "telescope live grep";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
        mode = "n";
        options.desc = "telescope find buffers";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
        mode = "n";
        options.desc = "telescope help page";
      }
      {
        action = "<cmd>Telescope marks<CR>";
        key = "<leader>ma";
        mode = "n";
        options.desc = "telescope find marks";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fo";
        mode = "n";
        options.desc = "telescope find oldfiles";
      }
      {
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
        key = "<leader>fz";
        mode = "n";
        options.desc = "telescope find in current buffer";
      }
      {
        action = "<cmd>Telescope git_commits<CR>";
        key = "<leader>cm";
        mode = "n";
        options.desc = "telescope git commits";
      }
      {
        action = "<cmd>Telescope git_status<CR>";
        key = "<leader>gt";
        mode = "n";
        options.desc = "telescope git status";
      }
      {
        action = "<cmd>Telescope terms<CR>";
        key = "<leader>pt";
        mode = "n";
        options.desc = "telescope pick hidden termn";
      }
      {
        action = "<cmd>Telescope themes<CR>";
        key = "<leader>th";
        mode = "n";
        options.desc = "telescope nvchad themes";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
        mode = "n";
        options.desc = "telescope find_files";
      }
      {
        action = "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>";
        key = "<leader>fa";
        mode = "n";
        options.desc = "telescope find all files";
      }
      {
        action = "<C-\\><C-N>";
        key = "<C-x>";
        mode = "t";
        options.desc = "terminal escape terminal mode";
      }
      {
        action = ''
        function()
          require("nvchad.term").new { pos = "sp" }
        end
        '';
        key = "<leader>h";
        mode = "n";
        options.desc = "terminal new horizontal term";
      }
      {
        action = ''
        function()
          require("nvchad.term").new { pos = "vsp" }
        end
        '';
        key = "<leader>v";
        mode = "n";
        options.desc = "terminal new vertical window";
      }
      {
        action = ''
        function()
          require("nvchad.term").toggle { pos = "vsp" id = "vtoggleTerm" }
        end
        '';
        key = "<A-v>";
        mode = ["n" "t"];
        options.desc = "terminal toggleable vertical term";
      }
      {
        action = ''
        function()
          require("nvchad.term").toggle { pos = "sp" id = "htoggleTerm" }
        end
        '';
        key = "<A-h>";
        mode = ["n" "t"];
        options.desc = "terminal toggleable horizontal term";
      }
      {
        action = ''
        function()
          require("nvchad.term").toggle { pos = "float" id = "floatTerm" }
        end
        '';
        key = "<A-i>";
        mode = "n";
        options.desc = "terminal toggle floating term";
      }
      {
        action = "<cmd>WhichKey<CR>";
        key = "<leader>wK";
        mode = "n";
        options.desc = "whichkey all keymaps";
      }
      {
        action = ''
        function()
          vim.cmd("WhichKey"..vim.fn.input "WhichKey: ")
        end
        '';
        key = "<leader>wk";
        mode = "n";
        options.desc = "whichkey query lookup";
      }
      {
        action = ''
        function()
          local config = { scope = {} }
          config.scope.exclude = { language = {}, node_type = {} }
          config.scope.include = { node_type = {} }
          local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

          if node then
            local start_row, _, end_row, _ = node:range()
            if start_row ~= end_row then
              vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0})
              vim.api.nvim_feedkeys("_", "n", true)
            end
          end
        end
        '';
        key = "<leader>cc";
        mode = "n";
        options.desc = "blankline jump to current context";
      }
      
      
      
      
      
      
      
      
    ];
  };
}
