{ pkgs, ... }: {

  programs.nixvim = {
  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
      name = "my-plugin";
      src = pkgs.fetchFromGitHub {
          owner = "huantrinh1802 ";
          repo = "m_taskwarrior_d.nvim";
          rev = "d0cf7a7e882e308ab203d9973ce3147a328258f7";
      };
  })];
  };
}
