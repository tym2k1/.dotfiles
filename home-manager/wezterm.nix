{ inputs, pkgs, ... }: {

  stylix.targets.wezterm.enable = true;

  programs.wezterm = {
        # package = inputs.nixpkgs-stable.legacyPackages.x86_64-linux.wezterm;
    enable = true;
    enableZshIntegration = true;
        extraConfig = ''
        return {
            hide_tab_bar_if_only_one_tab = true,
            window_decorations = "RESIZE",
            front_end = "WebGpu",
            use_fancy_tab_bar = true,
        }
        '';

  };

}
