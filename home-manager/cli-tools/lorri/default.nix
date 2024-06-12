{ inputs, pkgs, ... }: {

  services.lorri = {
    enable = true;
    enableNotifications = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

}
