{ inputs, pkgs, ... }: {

  home.packages = with pkgs; [
    nh
  ];

}
#pkgs.stdenv.mkDerivation {
#  name = "nh-wrapper";
#  src = null;
#
#  buildInputs = [ pkgs.nh pkgs.wrapProgram ];
#
#  phases = [ "installPhase" ];
#
#  installPhase = ''
#    mkdir -p $out/bin
#
#    # Use wrapProgram to create a wrapped nh with custom environment variable logic
#    wrapProgram ${pkgs.nh}/bin/nh \
#      --prefix PATH : ${pkgs.coreutils}/binju\
#      --run 'if [ "$1" = "os" ]; then export FLAKE=/path/to/your/nixos-flake; elif [ "$1" = "home" ]; then export FLAKE=/path/to/your/home-manager-flake; fi; exec "$@"'
#
#    mv ${pkgs.nh}/bin/nh $out/bin/nh
#  '';
#
#  meta = with pkgs.lib; {
#    description = "Wrapper for nh that sets different FLAKE environment variables for 'os' and 'home' commands";
#    license = licenses.mit;
#    maintainers = [ maintainers.yourself ];
#  };
#}
