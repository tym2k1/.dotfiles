{ inputs, pkgs, ... }: {

  programs.nixvim = {
    plugins = {
      render-markdown = {
        enable = true;
        settings = {
          checkbox = {
            custom = {
              important = { raw = "[e]"; rendered = "󰃰 ";};
            };
          };
        };
      };
    };
  };
}
