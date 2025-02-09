{ inputs, pkgs, ... }: {

  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.bullets-vim
    ];
    extraConfigLua = "require('bullets').setup({foo = 'bar'})";
  };
}
