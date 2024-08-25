{ inputs, pkgs, ... }: {

home.packages = with pkgs; [
  taskopen
];

home.sessionVariables = {
  ZK_NOTEBOOK_DIR = "$HOME/Notes/Zk";
};

programs = {
  zk = {
    enable = true;
    settings = {
      notebook = {
        dir = "~/Notes/Zk";
      };
      note = {
        language = "en";
        default-title = "Untitled";
        filename = "{{id}}";
        extension = "md";
        template = "default.md";
        id-charset = "alphanum";
        id-length = 8;
        id-case = "lower";
      };
      group.journal = {
        paths = [
          "journal/weekly"
          "journal/daily"
        ];
        note = {
          filename = "{{format-date now}}";
        };
      };
      tool = {
        editor = "$EDITOR";
      };
      format.markdown = {
        hashtags = true;
        colon-tags = true;
      };
      lsp = {
        diagnostics = {
          wiki-title = "hint";
          dead-link = "error";
        };
      };
    };
  };

  taskwarrior = {
    # config = {
    #   
    # };
  };
};

}
