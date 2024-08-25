{ inputs, pkgs, ... }: {

home.packages = with pkgs; [
  ripgrep
  ripgrep-all
];

programs = {
  zsh = {
    shellAliases = {
      rgf = "rg --files | rg";  
      rgfa = "rg --files --no-ignore --hidden | rg";
      rga = "rga --no-ignore --hidden";
    };
  };
};
}
