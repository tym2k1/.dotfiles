{ inputs, ... }: {


  imports = [
    ./otter.nix
  ];

  programs.nixvim = {
    plugins = {
      lsp-lines.enable = true;
      lsp = {
        preConfig = ''
          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
              border = "rounded",
            }
          )
          '';
        enable = true;
        servers = {
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          lua_ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          marksman = {
            enable = true;
          };
          pylsp = {
            enable = true;
          };
          nixd = {
            enable = true;
          };
          texlab = {
            enable = true;
          };
        };
      };
    };
  };
}
