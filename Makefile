HOST := $(shell hostname)

build:
	sudo nixos-rebuild switch --flake '.#$(HOST)'

flake:
	nix flake update 
	sudo nix build --profile /nix/var/nix/profiles/system/ .#nixosConfigurations.gamma.config.system.build.toplevel

rebuild:
	sudo nix build --profile /nix/var/nix/profiles/system/ .#nixosConfigurations.gamma.config.system.build.toplevel

total-build: flake build
	flake build
