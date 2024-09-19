{pkgs, ...}: {
  programs.nixvim = {
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
      luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lua.enable = true;
      which-key.enable = true;     
      lsp = {
        enable = true;
        servers = {
          lua-ls.enable = true;
          nixd.enable = true; # nix LSP
          html.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];

        settings.mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            __raw = ''
              function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
        };
      };
      direnv.enable = true;
      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };
      crates-nvim.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      cmp-nvim-lsp
      conform-nvim
      vim-tmux-navigator
      gruvbox
    ];
  };
}
