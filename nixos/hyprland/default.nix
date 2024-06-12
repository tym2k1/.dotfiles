{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
#    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
  ];
}
