{ config, pkgs, inputs, userConf, ... }:

{
  
  home.username = "${userConf.username}";
  home.homeDirectory = "/home/${userConf.username}";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    du-dust
    btop
    xdragon
    tldr
    ctpv
    fzf
    logseq
    fastfetch
    trash-cli
    nh
    thunderbird
    unzip
    file
    zathura
    qpwgraph
    discord
    gnupg
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  imports = [
    ./cli-tools
    ./git
    ./kitty.nix
    ./hyprland
    ./development
    ./graphics
    ./stylix
  ];

}
