{ pkgs, ... }: {

  programs.nixvim = {
    extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
        name = "zk-visgraph";
        src = pkgs.fetchFromGitHub {
            owner = "tym2k1";
            repo = "zk-visgraph";
            rev = "c974eade902ab886582cbc450609686783b6bcbe";
            hash = "sha256-+RGDmPBgwDhtQVs3o1iydtR+LndWZYl4RUcw7r+hQE0=";
        };
  })];
  };
}
