{ pkgs, lib, config, ... }:
let
  cfg = config.extendoid.scripts;
  scripts = import ./nix/addons.nix { inherit pkgs; };
in {
  options = {
    extendoid.scripts.enable = lib.mkEnableOption "Activate some addons, like fetch-github or extract";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib.concatLists [ scripts ];
  };
}
