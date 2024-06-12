{ config, pkgs, ... }:

let
  fileHandlerSrc = ./file-handler.c;
in {
  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  home.packages = with pkgs; [
    (pkgs.stdenv.mkDerivation {
      name = "file-handler";
      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = [ pkgs.dbus ];

      # Override the unpackPhase to do nothing
      unpackPhase = "true";

      buildPhase = ''
        gcc -o file-handler ${fileHandlerSrc} $(pkg-config --cflags --libs dbus-1)
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp file-handler $out/bin/
      '';
    })
  ];
}
