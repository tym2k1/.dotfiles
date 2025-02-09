{ inputs, ... }: {

  programs.nixvim = {
    plugins = {
      comment.enable = true;
    };
    keymaps = [
      {
        mode = "n";
        lhs = "g>";
        rhs = "v:lua.require('comment.api').call('comment.linewise', 'g@')";
        options = {
          silent = true;
          expr = true;
          desc = "Comment region linewise";
        };
      }
    ];
  };

}
