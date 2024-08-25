{ inputs, pkgs, ... }: {

  home.packages = with pkgs; [
    inkscape
    gimp
    freecad
  ];

}
