{
  description = "Basic flake to manage my scripts, CLI utils";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: 
      let pkgs = import nixpkgs { inherit system; };
      in {
	  devShells.default = pkgs.mkShell {
	    packages = with pkgs; [
	      rustc
	      cargo
	      rustfmt
	      clippy
	      rust-analyzer
	      pkg-config
	      openssl.dev
	    ];
	  };
      });
}
