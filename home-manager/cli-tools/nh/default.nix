{ inputs, pkgs, userConf, ... }: {

#  programs.nh = {
#    enable = true;
#    clean.enable = true;
#    clean.extraArgs = "--keep-since 4d --keep 3";
#  };


  home.packages = with pkgs;[
    nh
  ];
  
  # This is ugly. Related issue https://github.com/viperML/nh/issues/88
  # Take a look at https://github.com/viperML/wrapper-manager 
#programs.zsh.initExtra = ''
#  nh_home() {
#    command nh home "$1" "$${@:2}" /home/${userConf.username}/.dotfiles/home-manager
#  }
#
#  nh_os() {
#    command nh os "$1" "$${@:2}" /home/${userConf.username}/.dotfiles/nixos
#  }
#
#  nh() {
#    case "$1" in
#      home)
#        shift
#        nh_home "$@"
#        ;;
#      os)
#        shift
#        nh_os "$@"
#        ;;
#      *)
#        echo "Unknown command: $1"
#        ;;
#    esac
#  }
#'';
}
