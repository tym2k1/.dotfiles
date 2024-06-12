{ inputs, pkgs, ... }: {

home.packages = with pkgs; [
  ripgrep
  ripgrep-all
];

programs = {
  zsh = {
    shellAliases = {
      rgf = "rg --files | rg";  
    };
  };
};
}
