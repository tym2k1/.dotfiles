{ inputs, pkgs, ... }: {

home.packages = with pkgs; [
  bat
];

programs = {
  zsh = {
    shellAliases = {
      cat = "bat --style plain --pager never --theme base16";
    };
  };
};
}
