{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, nixvim, stylix, zjstatus, ... }@inputs:
    let
      userConf = import ../config.nix;
      # pkgs = nixpkgs.legacyPackages.${userConf.system};
      overlays = with inputs; [
	# ...
	(final: prev: {
	  zjstatus = zjstatus.packages.${prev.system}.default;
	})
      ];
      pkgs = import nixpkgs {
        system = userConf.system;
        overlays = overlays;
	config = {
	  allowUnfree = true;
	  allowUnfreePredicate = (_: true);
	};
      };
    in {
      homeConfigurations = {
	${userConf.username} = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;

	  # Specify your home configuration modules here, for example,
	  # the path to your home.nix.
	  modules = [
	  ./home.nix
	  stylix.homeManagerModules.stylix
	  ];
	  
	  extraSpecialArgs = {
	    inherit inputs userConf;
	  };
	  # Optionally use extraSpecialArgs
	  # to pass through arguments to home.nix
	};
      };
    };
}
