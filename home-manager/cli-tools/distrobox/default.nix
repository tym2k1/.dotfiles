{ pkgs, userConf,... }: {

home.packages = with pkgs; [
  distrobox
];

home.file.".config/distrobox/distrobox.conf".text =
  ''
container_additional_volumes="/nix:/nix"
PATH="$PATH:/home/${userConf.username}/.nix-profile/bin"
  '';

programs.zsh.localVariables = {
  ZSH_DISABLE_COMPFIX=true;
};
}
