{ pkgs, ... }:
{
  stylix.image = ./wallpaper.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.fonts = {
    serif = {
      package = pkgs.fira;
      name = "Fira Sans";
    };

    sansSerif = {
      package = pkgs.fira;
      name = "Fira Sans";
    };

    monospace = {
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      name = "FiraCode";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 11;
      desktop = 10;
      popups = 10;
      terminal = 11;
    };
  };

  stylix.cursor = {
    package = pkgs.capitaine-cursors-themed;
    name = "Capitaine Cursors (Gruvbox)";
    size = 24;
  };

#  stylix.opacity = {
#    applications = 1.0;
#    desktop = 1.0;
#    popups = 1.0;
#    terminal = 1.0;
#  };

}
