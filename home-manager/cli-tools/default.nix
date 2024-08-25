{ inputs, pkgs, ... }: {

imports = [
  ./zsh
  ./nixvim
  ./bat
  ./eza
  ./zellij
  ./lf
  ./nh
  ./distrobox
  ./devenv
  ./ripgrep
  ./taskwarrior
  ];


  home.packages = with pkgs; [
    du-dust
    btop
    xdragon
    tldr
    ctpv
    fzf
    fastfetch
    trash-cli
    nh
    unzip
    file
    sage
  ];

}
