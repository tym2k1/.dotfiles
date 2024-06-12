{ inputs, pkgs, ... }:
{
  imports = [
    #./hyprland-config.nix
    ./waybar.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor= ",preferred,auto,1";

      general = {
	gaps_in = 5;
	gaps_out = 20;
	border_size = 2;
	layout = "dwindle";
      };

      input = {
	kb_layout = "us";
      };
      
      dwindle = {
	pseudotile = "yes";
	preserve_split = "yes";
      };

      "$mod" = "SUPER";
      
      bind =[
	"$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
	"$mod, Q, killactive,"
	"$mod, M, exit,"
	"$mod, V, togglefloating,"
	"$mod, R, exec, ${pkgs.wofi}/bin/wofi --show drun"
	"$mod, P, pseudo, # dwindle"
	"$mod, J, togglesplit, # dwindle"
	"$mod, F, fullscreen"

	# Move focus with mainMod + arrow keys
	"$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"

	# Switch workspaces with mainMod + [0-9]
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"
	"$mod, 0, workspace, 10"

	# Move active window to a workspace with mainMod + SHIFT + [0-9]
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
	"$mod SHIFT, 0, movetoworkspace, 10"

      ];

      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

    };
  };
}
