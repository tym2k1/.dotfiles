{ inputs, userConf, ... }: {

  programs.nixvim = {
    plugins = {
      openscad = {
        enable = true;
      };
    };
  };
}
