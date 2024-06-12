{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pano
  ];
}
