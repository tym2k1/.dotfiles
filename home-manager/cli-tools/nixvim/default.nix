{ inputs, config, ... }: {

  stylix.targets.nixvim.enable = false;

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./bufferline
    ./treesitter
    ./indent-blankline
    ./lsp
    ./cmp
    ./zk
    ./which-key
    # ./bullets
    # ./comment
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };
    opts = {
      number = true;
      expandtab = true;
      shiftwidth = 2;
      title = true;
      titlelen = 0;
      titlestring = "nvim:%{fnamemodify(expand('%:p'), ':~')}"; 
    };
    plugins = {
      lualine.enable = true;
    };
    colorschemes.base16 = {
      enable = true;
      settings.telescope_borders = true;
      colorscheme = {
          base00 = "#${config.lib.stylix.colors.base00}";
          base01 = "#${config.lib.stylix.colors.base01}";
          base02 = "#${config.lib.stylix.colors.base02}";
          base03 = "#${config.lib.stylix.colors.base03}";
          base04 = "#${config.lib.stylix.colors.base04}";
          base05 = "#${config.lib.stylix.colors.base05}";
          base06 = "#${config.lib.stylix.colors.base06}";
          base07 = "#${config.lib.stylix.colors.base07}";
          base08 = "#${config.lib.stylix.colors.base08}";
          base09 = "#${config.lib.stylix.colors.base09}";
          base0A = "#${config.lib.stylix.colors.base0A}";
          base0B = "#${config.lib.stylix.colors.base0B}";
          base0C = "#${config.lib.stylix.colors.base0C}";
          base0D = "#${config.lib.stylix.colors.base0D}";
          base0E = "#${config.lib.stylix.colors.base0E}";
          base0F = "#${config.lib.stylix.colors.base0F}";
        };
    };
  };

}
