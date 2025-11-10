{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
}
