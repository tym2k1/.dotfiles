{ inputs, pkgs, ... }: {

# Nix on distributions other than NixOS can't change your default shell
# but it can stil manage it. You have to download zsh via your system's
# package manager and then use `chsh -s /bin/zsh $USER` to set it as the default.

home.sessionVariables = {
  EDITOR = "nvim";
  VISUAL = "nvim";
};

programs = {
  zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    history = {
      extended = true;
      share = true;
      };
    plugins = [
      {
	name = "zsh-nix-shell";
	file = "nix-shell.plugin.zsh";
	src = pkgs.fetchFromGitHub {
	  owner = "chisui";
	  repo = "zsh-nix-shell";
	  rev = "v0.8.0";
	  sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
	};
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
	"git"
	];
      };

    #initExtra = ''
    #    ${pkgs.any-nix-shell} zsh --info-right | source /dev/stdin
    #  '';
#    initExtra=
#    ''
#export ZSH_COMPDUMP=$HOME/.cache/oh-my-zsh/completions/zcompdump
#    '';
    };
  };
imports = [
./starship.nix
];
}
