{ inputs, userConf, ... }: {

  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          auto_install = true;
          parser_install_dir = "/home/${userConf.username}/.cache/nvim/treesitter";
          highlight = {
            enable = true;
          };
        };
      };
    };
  };
}
