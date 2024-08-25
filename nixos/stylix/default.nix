{ config, pkgs, ... }:
{
  imports = [
    ../../stylix.nix
  ];

  stylix.targets = {
    console.enable = true;
    gnome.enable = true;
    gtk.enable = true;
    nixos-icons.enable = true;
    plymouth.enable = true;
  };
}
