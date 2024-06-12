{ inputs, pkgs, userConf, ... }: {

imports = [
  ./git-identity.nix
  ];

  programs.git = {
    enable = true;
    aliases = {
	ci = "commit";
	co = "checkout";
	cp = "cherry-pick";
	br = "branch";
	sh = "show";
	st = "status";
	df = "diff";
	dc = "diff --cached";
	lg = "log -p";
	lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
	lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
	lolb = "log --graph --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all --simplify-by-decoration";
	hist = "log --pretty=format:\'%h %ad|%s%d [%an]\' --graph --date=short";
	lolg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
	ls = "ls-files";
	edit-unmerged = "'!$EDITOR `git diff --name-only --diff-filter=U`'";
	# Show files ignored by git:
	ign = "ls-files -o -i --exclude-standard";
	dt = "difftool";
	tags = "for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags";
	sm = "submodule update --init --recursive";
	get-remote = "config --get remote.origin.url";
    };
    extraConfig = {
      color = {
	ui = "auto";
	branch = {
	  current = "yellow reverse";
	  local = "yellow";
	  remote = "green";
	};
	diff = {
	  meta = "yellow";
	  frag = "magenta";
	  old = "red";
	  new = "green";
	};
	status = {
	  added = "yellow";
	  changed = "green";
	  untracked = "cyan";
	};
      };
      core = {
	abbrev = 12;
	pager = "less -F -X";
	autocrlf = "input";
	excludesfile = "/home/${userConf.username}/.global_ignore";
	editor = "nvim";
      };
      pack = {
	windowMemory = "100m";
	SizeLimit = "100m";
	threads = 1;
      };
      sendmail = {
	smtpserver = "/usr/bin//msmtp";
      };
      push = {
	default = "matching";
      };
      gpg = {
	program = "gpg";
      };
      commit = {
	gpgsign = "true";
      };
    };
  };
}
