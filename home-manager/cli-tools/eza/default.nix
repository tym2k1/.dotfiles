{ inputs, pkgs, ... }: {

home.packages = with pkgs; [
  eza
];

programs = {
  zsh = {
    shellAliases = {
      ls = "eza --icons --classify=always --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group";
      l = "ls -l";
      tree = "eza --tree --icons";
    };
  };
};

}
