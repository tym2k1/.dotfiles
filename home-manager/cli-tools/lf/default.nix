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
	editor-open = ''$$EDITOR $f'';
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

      p = "";
      pp = "paste";

      do = "dragon-out";

      e = "editor-open";
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
cmd on-quit &{{
  %${pkgs.ctpv}/bin/ctpv -e $id
  printf "\e]7;\e\\" > /dev/tty
}}
set cleaner ${pkgs.ctpv}/bin/ctpvclear
set cursorpreviewfmt "\033[7m"
cmd on-cd &{{
  printf "\033]0; ''${PWD/#$HOME/lf:~}\007" > /dev/tty
  export STARSHIP_SHELL=zsh
  fmt="$(starship prompt)"
  set promptfmt \"$fmt\"
}}
on-cd
#cmap <enter> &{{
#  if [ "$lf_mode" = "command" ]; then
#      lf -remote "send $id complete-cmd"
#  else
#      lf -remote "send $id cmd-enter"
#  fi
#}}

#cmd complete-cmd :{{
#  # position cursor at the end of the first word
#  cmd-home
#  cmd-word
#cd
#  # perform tab completion before running the command
#  cmd-complete
#  cmd-enter
#}}
cmd quit-and-cd &{{
  pwd > $LF_CD_FILE
  lf -remote "send $id quit"
}}

map q quit-and-cd
map Q quit
'';
};

}
