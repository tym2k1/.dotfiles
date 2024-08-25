{ inputs, config, ... }: {

  programs.nixvim = {

    keymaps = [
      {
        action = "<cmd>bnext<CR>";
        key = "<Tab>";
        options = {
          silent = true;
        };
      }
      {
        action = "<cmd>bprevious<CR>";
        key = "<S-Tab>";
        options = {
          silent = true;
        };
      }
    ];

    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          always_show_bufferline = false;
          show_buffer_close_icons = false;
          show_close_icon = false;
          separator_style = "thin";
          indicator = {
            icon = null;
            style = null;
          };
        };
        # highlights = {
        #   background = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   bufferSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   bufferVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   closeButton = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   closeButtonSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   closeButtonVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   diagnostic = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   diagnosticSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   diagnosticVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   duplicate = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   duplicateSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   duplicateVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   error = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   errorDiagnostic = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   errorDiagnosticSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   errorDiagnosticVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   errorSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   errorVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   fill = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   hint = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   hintDiagnostic = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   hintDiagnosticSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   hintDiagnosticVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   hintSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   hintVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   indicatorSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   indicatorVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   info = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   infoDiagnostic = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   infoDiagnosticSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   infoDiagnosticVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   infoSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   infoVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   modified = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   modifiedSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   modifiedVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   numbers = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   numbersSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   numbersVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   offsetSeparator = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   pick = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   pickSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   pickVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   separator = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #     fg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   separatorSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #     fg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   separatorVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #     fg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   tab = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   tabClose = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   tabSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   tabSeparator = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   tabSeparatorSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   trunkMarker = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   warning = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   warningDiagnostic = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   warningDiagnosticSelected = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        #   warningVisible = {
        #     bg = "#${config.lib.stylix.colors.base01}";
        #   };
        # };
      };
    };
  };
}

