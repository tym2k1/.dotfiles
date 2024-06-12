{ inputs, pkgs, config, ... }:
{

home.file.".config/zellij/layouts/default.kdl".text =
    ''
layout {
  default_tab_template {
    children
    pane size=1 borderless=true {
      plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
	format_left  "#[fg=#${config.lib.stylix.colors.base07},bold] {session} {mode} {tabs}"
	format_right "#[bg=#${config.lib.stylix.colors.base0B},fg=#${config.lib.stylix.colors.base00}] #[bg=#${config.lib.stylix.colors.base0B},fg=#${config.lib.stylix.colors.base00},bold]{swap_layout} #[bg=#${config.lib.stylix.colors.base00},fg=#${config.lib.stylix.colors.base0B}]"

	mode_locked "#[fg=#${config.lib.stylix.colors.base0E},bold] {name}"
	mode_normal "#[fg=#${config.lib.stylix.colors.base0B},bold] {name}"
	mode_resize "#[fg=#${config.lib.stylix.colors.base0F},bold] {name}"
	mode_default_to_mode "resize"

	tab_normal "#[bg=#${config.lib.stylix.colors.base07},fg=#${config.lib.stylix.colors.base00}] #[bg=#${config.lib.stylix.colors.base07},fg=#${config.lib.stylix.colors.base00},bold]{name} {sync_indicator}{fullscreen_indicator}{floating_indicator}#[bg=#${config.lib.stylix.colors.base00},fg=#${config.lib.stylix.colors.base07}]"
	tab_active "#[bg=#${config.lib.stylix.colors.base0B},fg=#${config.lib.stylix.colors.base00}] #[bg=#${config.lib.stylix.colors.base0B},fg=#${config.lib.stylix.colors.base00},bold]{name} {sync_indicator}{fullscreen_indicator}{floating_indicator}#[bg=#${config.lib.stylix.colors.base00},fg=#${config.lib.stylix.colors.base0B}]"

	tab_sync_indicator       " "
	tab_fullscreen_indicator "󰹑 "
	tab_floating_indicator   "󰉈 "
      }
    }
  }
}
    '';

home.file.".config/zellij/layouts/default.swap.kdl".text =
    ''

swap_tiled_layout name="Vertical" {

  tab max_panes=5 {
    pane split_direction="vertical" {
      pane
      pane { children; }
    }
  }

  tab max_panes=8 {
    pane split_direction="vertical" {
      pane { children; }
      pane { pane; pane; pane; pane; }
    }
  }

  tab max_panes=12 {
    pane split_direction="vertical" {
      pane { children; }
      pane { pane; pane; pane; pane; }
      pane { pane; pane; pane; pane; }
    }
  }

}

swap_tiled_layout name="Horizontal" {

  tab max_panes=5 {
    pane
    pane
  }

  tab max_panes=8 {
    pane {
    pane split_direction="vertical" { children; }
    pane split_direction="vertical" { pane; pane; pane; pane; }
    }
  }

  tab max_panes=12 {
    pane {
      pane split_direction="vertical" { children; }
      pane split_direction="vertical" { pane; pane; pane; pane; }
      pane split_direction="vertical" { pane; pane; pane; pane; }
    }
  }

}

swap_tiled_layout name="Stacked" {

  tab min_panes=5 {
    pane split_direction="vertical" {
      pane
      pane stacked=true { children; }
    }
  }

}

swap_floating_layout name="Staggered" {
  floating_panes
}

swap_floating_layout name="Enlarged" {
  floating_panes max_panes=10 {
    pane { x "5%"; y 1; width "90%"; height "90%"; }
    pane { x "5%"; y 2; width "90%"; height "90%"; }
    pane { x "5%"; y 3; width "90%"; height "90%"; }
    pane { x "5%"; y 4; width "90%"; height "90%"; }
    pane { x "5%"; y 5; width "90%"; height "90%"; }
    pane { x "5%"; y 6; width "90%"; height "90%"; }
    pane { x "5%"; y 7; width "90%"; height "90%"; }
    pane { x "5%"; y 8; width "90%"; height "90%"; }
    pane { x "5%"; y 9; width "90%"; height "90%"; }
    pane focus=true { x 10; y 10; width "90%"; height "90%"; }
  }
}

swap_floating_layout name="Spread" {
  floating_panes max_panes=1 {
    pane {y "50%"; x "50%"; }
  }
  floating_panes max_panes=2 {
    pane { x "1%"; y "25%"; width "45%"; }
    pane { x "50%"; y "25%"; width "45%"; }
  }
  floating_panes max_panes=3 {
    pane focus=true { y "55%"; width "45%"; height "45%"; }
    pane { x "1%"; y "1%"; width "45%"; }
    pane { x "50%"; y "1%"; width "45%"; }
  }
  floating_panes max_panes=4 {
      pane { x "1%"; y "55%"; width "45%"; height "45%"; }
    pane focus=true { x "50%"; y "55%"; width "45%"; height "45%"; }
    pane { x "1%"; y "1%"; width "45%"; height "45%"; }
    pane { x "50%"; y "1%"; width "45%"; height "45%"; }
  }
}
    '';

}
