{ inputs, pkgs, ... }: {

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      search = {
        force = true;
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
      };
      settings = {
        "browser.compactmode.show" = true;
        "browser.cache.disk.enable" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        #TabsToolbar {
          visibility: collapse;
        }
      '';
      userContent = "";
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        # To view supported extensions run:
        # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"
        ublock-origin
        tree-style-tab
        tst-indent-line
        tst-active-tab-on-scroll-bar
        bitwarden
        tridactyl
      ];
      containersForce = true;
      containers = {
        work = {
          color = "red";
          icon = "briefcase";
          id = 2;
        };
        chill = {
          color = "turquoise";
          icon = "chill";
          id = 1;
        };
      };
    };
  };

}
