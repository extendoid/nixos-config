{
  description = "Flake-based NixOS configuration for gamma";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux"; 
    in {
      nixosConfigurations.gamma = nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = { inherit inputs; };
	modules = [
	  ./configuration.nix
	  ./hardware-configuration/gamma-hardware.nix
	];
      };

      homeConfigurations."extendoid" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
	modules = [ ./home/extendoid/home.nix ];
      };
    };
}
