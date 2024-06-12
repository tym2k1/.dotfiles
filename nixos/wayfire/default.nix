{ config, pkgs, ... }:

let
  # Read the content of the file
  configFileContent = builtins.readFile ./wayfire.ini;

  # Define the file in the Nix store
  configFile = pkgs.writeText "wayfire.ini" configFileContent;

in
{
  environment.etc."wayfire.ini".source = configFile;

  environment.sessionVariables = {
    WAYFIRE_CONFIG_FILE = "/etc/wayfire.ini";
  };

  programs.wayfire = {
    enable = true;
    plugins = [];
  };

  environment.systemPackages = with pkgs; [
    waybar
    wofi
  ];

}
