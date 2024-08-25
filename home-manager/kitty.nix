{ inputs, pkgs, ... }: {

  stylix.targets.kitty.enable = true;

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      hide_window_decorations = true;
    };
  };

  programs = {
    zsh = {
      shellAliases = {
        icat = "kitten icat";
        ssh = "kitten ssh";
      };
    };
  };

}
