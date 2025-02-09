{ inputs, userConf, ... }: {

  imports = [
    # ./rnote.nix
    # ./zk-visgraph.nix
  ];

  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>ZkNotes<CR>";
        key = "<leader>zs";
        options = {
          silent = true;
          desc = "Search notes by name";
        };
      }
      {
        action = "<cmd>ZkTags<CR>";
        key = "<leader>zt";
        options = {
          silent = true;
          desc = "Search notes by tags";
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
      {
        action = "<cmd>ZkBacklinks<CR>";
        key = "<leader>zb";
        options = {
          silent = true;
          desc = "See backlinks to this note";
        };
      }
      {
        action = "<cmd>ZkLinks<CR>";
        key = "<leader>zl";
        options = {
          silent = true;
          desc = "List notes linked in this note";
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
