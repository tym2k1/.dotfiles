{ inputs, userConf, ... }: {

  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>ZkNotes<CR>";
        key = "<leader>zl";
        options = {
          silent = true;
          desc = "Search Notes";
        };
      }
      {
        action = "<cmd>ZkTags<CR>";
        key = "<leader>zt";
        options = {
          silent = true;
          desc = "Search Tags";
        };
      }
      {
        action = "<cmd>ZkNew<CR>";
        key = "<leader>zn";
        options = {
          silent = true;
          desc = "New Note";
        };
      }
    ];
    plugins = {
      zk = {
        enable = true;
        settings = {
          picker = "telescope";
        };
      };
      telescope = {
        enable = true;
      };
    };
  };
}
