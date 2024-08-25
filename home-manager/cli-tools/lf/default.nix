{ inputs, pkgs, ... }:

let
  # Put the lf-cd-on-q script into the nix store as an executable
  lfScript =
    pkgs.writeShellScriptBin "lf-wrapper" (builtins.readFile ./lf-cd-on-q);
in {

  home.packages = with pkgs; [
    lfScript
  ];

  imports = [
    # ./d-bus
    ./ctpv
  ];

  programs.zsh = {
    enable = true;
    initExtra = ''
      # Source the lf-cd-on-q script
      source ${lfScript}/bin/lf-wrapper
    '';
  };

  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = {
	editor-open = ''$$EDITOR $(echo "$f" | tr '\n' ' ' | xargs -d ' ' -I {} sh -c 'if [ ! -d "{}" ]; then echo "{}"; fi')'';
	# echo "$fx" | tr '\n' ' ' converts the newline-separated list into a space-separated list.
	# This version opens everything in a directory
	# If the item is a directory (-d "{}"), it uses find to list all files within that directory (find "{}" -type f).
	# editor-open-select = ''$$EDITOR $(echo "$fx" | tr '\n' ' ' | xargs -I {} sh -c 'if [ -d "{}" ]; then find "{}" -type f; else echo "{}"; fi' | tr '\n' ' ')'';
	editor-open-select = ''$$EDITOR $(echo "$fx" | tr '\n' ' ' | xargs -d ' ' -I {} sh -c 'if [ ! -d "{}" ]; then echo "{}"; fi' | tr '\n' ' ')'';
	mkdir = ''
	''${{
	  printf "Directory Name: "
	  read DIR
	  mkdir $DIR
	}}
	'';
	dragon = ''&${pkgs.xdragon}/bin/xdragon -a -x -T $(echo $fx)'';
	yank-path = ''&${pkgs.wl-clipboard}/bin/wl-copy "$(echo $fx)"'';
	yank-name = ''&${pkgs.wl-clipboard}/bin/wl-copy "$(echo $fx | while read -r line; do basename "$line"; done)"'';
      };

    keybindings = {
      #"\\\"" = "";
      #o = "";
      #p = "";

      "<backspace2>" = "set hidden!";
      y = "";
      yy = "copy";
      yp = "yank-path";
      yn = "yank-name";

      d = "";
      dd = "cut";

      p = "";
      pp = "paste";

      do = "dragon-out";

      e = "editor-open";
      E = "editor-open-select";

      q = "quit-and-cd";
      Q = "quit";
    };


    settings = {
      preview = true;
      icons = true;
      # drawbox = true;
      ignorecase = true;
      number = true;
      autoquit = true;
      shell = "zsh";
      info = [ "size" ];
    };

    previewer = {
      keybinding = "i";
      source = "${pkgs.ctpv}/bin/ctpv";
    };

    extraConfig = ''
set cleaner ${pkgs.ctpv}/bin/ctpvclear
set cursorpreviewfmt "\033[7m"

cmd on-quit &{{
  %${pkgs.ctpv}/bin/ctpv -e $id
  printf "\e]7;\e\\" > /dev/tty
}}

cmd on-cd &{{
  printf "\033]0; ''${PWD/#$HOME/lf:~}\007" > /dev/tty
  # fmt="$(STARSHIP_SHELL= starship prompt | sed 's/\\/\\\\/g;s/"/\\"/g')"
  # lf -remote "send $id set promptfmt \"$fmt\""
}}

cmd quit-and-cd &{{
  pwd > $LF_CD_FILE
  lf -remote "send $id quit"
}}

cmd on-focus-lost %{{
  lf -remote "send $id recol"
}}

cmd on-focus-gained %{{
  lf -remote "send $id recol"
}}

cmd on-redraw %{{
  lf -remote "send $id recol"
}}

cmd on-select &{{
  lf -remote "send $id eza-status"
}}

cmd recol %{{
    if [ $lf_width -le 60 ]; then
        lf -remote "send $id :set preview false; set ratios 1"
    elif [ $lf_width -le 120 ]; then
        lf -remote "send $id :set preview true; set ratios 1:1"
    else
        lf -remote "send $id :set preview true; set ratios 1:2:3"
    fi
}}

cmd eza-status &{{
    lf -remote "send $id set statfmt \"$(eza -ld --created --modified --binary --group --git --color=always "$f" | sed 's/\\/\\\\/g;s/"/\\"/g')\""
}}

# Startup
on-cd
lf -remote "send $id recol"
eza-status
'';
};

}
