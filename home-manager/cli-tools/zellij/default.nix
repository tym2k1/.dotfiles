{ inputs, pkgs, config, ... }: {

  stylix.targets.zellij.enable = false;

  imports = [
    ./zjstatus
  ];


  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
      theme = "default";
      themes = {
	default = {
	  fg = "#${config.lib.stylix.colors.base07}";
	  bg = "#${config.lib.stylix.colors.base00}";
	  black = "#${config.lib.stylix.colors.base00}";
	  red = "#${config.lib.stylix.colors.base08}";
	  green = "#${config.lib.stylix.colors.base0B}";
	  yellow = "#${config.lib.stylix.colors.base0A}";
	  blue = "#${config.lib.stylix.colors.base0D}";
	  magenta = "#${config.lib.stylix.colors.base0E}";
	  cyan = "#${config.lib.stylix.colors.base0C}";
	  white = "#${config.lib.stylix.colors.base07}";
	  orange = "#${config.lib.stylix.colors.base09}";
	};
      };
    };
  };

}
