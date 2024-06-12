{ inputs, pkgs, ... }: {

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      hide_window_decorations = true;
    };
  };
}
