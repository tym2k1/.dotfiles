{ inputs, pkgs, ... }: {

home.packages = with pkgs; [
  distrobox
  docker
];

home.file.".config/distrobox/distrobox.conf".text =
  ''
container_additional_volumes="/nix:/nix"
  '';

programs.zsh.localVariables = {
  ZSH_DISABLE_COMPFIX=true;
};
}
