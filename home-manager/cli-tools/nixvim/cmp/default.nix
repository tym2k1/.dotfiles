{ inputs, config, ... }: {

  programs.nixvim = {
    highlight = {
      CmpItemAbbr = {
        bg = "#${config.lib.stylix.colors.base00}";
        fg = "#${config.lib.stylix.colors.base04}";
      };
      CmpItemAbbrMatch= {
        bg = "#${config.lib.stylix.colors.base00}";
        fg = "#${config.lib.stylix.colors.base07}";
        bold = true;
      };
      CmpItemAbbrMatchFuzzy = {
        bg = "#${config.lib.stylix.colors.base00}";
        fg = "#${config.lib.stylix.colors.base07}";
        bold = true;
      };
    };
    plugins = {
      # LSP autocompletion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = false })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
          };
          window.documentation = {
            border = [
              "╭" "╴" "╮" "╎" "╯" "╴" "╰" "╎"
            ];
            winhighlight = "FloatBorder:NormalFloat";
          };
          window.completion = {
            border = [
              "╭" "─" "╮" "│" "╯" "─" "╰" "│"
            ];
            winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat,CursorLine:PmenuSel,Search:None";
            side_padding = 0;
          };
          sources = [
            { name = "nvim_lua"; }
            { name = "nvim_lsp"; }
            { name = "cmdline"; }
            { name = "path"; }
            { name = "luasnip"; }
            { name = "buffer"; }
          ];
        };
      };
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true; 
      cmp-cmdline.enable = true;
      cmp-path.enable = true;
      cmp-dictionary.enable = true;
      cmp-treesitter.enable = true;
      luasnip.enable = true;
    };
  };
}
