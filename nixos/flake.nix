{
  description = "tym2k1's NixOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, stylix, ... }@inputs:
  let
    userConf = import ../config.nix;
  in {
    nixosConfigurations = {
      HPVictus15 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./configuration.nix
          stylix.nixosModules.stylix
        ];
      };
    };
  };
}
