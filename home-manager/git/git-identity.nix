{ config, lib, pkgs, ... }:

let
  # put a shell script into the nix store
  gitIdentity =
    pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity);
in {
  home.packages = with pkgs; [
    gitIdentity
    fzf
  ];

  programs.git = {
    extraConfig = {
      # extremely important, otherwise git will attempt to guess a default user identity. see `man git-config` for more details
      user.useConfigOnly = true;

      # the `work` identity
      user.work.name = "Tymoteusz Burak";
      user.work.email = "tymoteusz.burak@3mdeb.com";

      # the `personal` identity
      user.personal.name = "Tymoteusz Burak";
      user.personal.email = "tymbur@gmail.com";

    };
    # This is optional, as `git identity` will call the `git-identity` script by itself, however
    # setting it up explicitly as an alias gives you autocomplete
    aliases = {
      identity = "! git-identity";
      id = "! git-identity";
    };
  };

}
