{ inputs, config, ... }: {

  programs.nixvim = {
    highlight.BaseIndent = {
      fg = "#${config.lib.stylix.colors.base01}";
    };
    highlight.ScopeIndent = {
      fg = "#${config.lib.stylix.colors.base03}";
    };
    plugins = {
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            smart_indent_cap = false;
            highlight = "BaseIndent";
          };
          scope = {
            highlight = "ScopeIndent";
            show_start = true;
            show_end = true;
            show_exact_scope = true;
          };
        };
      };
    };
  };
}
