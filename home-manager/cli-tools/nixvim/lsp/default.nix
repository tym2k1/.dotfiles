{ inputs, ... }: {

  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
          };
        marksman = {
          enable = true;
          };
        };
      };
    };
  };
}

