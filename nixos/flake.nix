{
  description = "tym2k1's NixOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, stylix, ... }@inputs:
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

        # Pass both stable and unstable pkgs to the system
        specialArgs = {
          inherit inputs nixpkgs-unstable;
        };
      };
    };
  };
}
