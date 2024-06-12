{ inputs, ... }: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };
    opts = {
      number = true;
      shiftwidth = 2;
      title = true;
      titlelen = 0;
      titlestring = "nvim:%{fnamemodify(expand('%:p'), ':~')}"; 
    };
    plugins = {
      lualine.enable = true;
      lsp = {
	enable = true;
	servers = {
	
	};
      };
    };
  };

}
