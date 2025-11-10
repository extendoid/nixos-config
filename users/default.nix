{ config, lib, pkgs, ... }:
let
  cfg = config.nixosUsers;
in
{
  options = { nixosUsers = { extendoid = lib.mkEnableOption "My profile"; }; };
  config = lib.mkIf cfg.extendoid {
    users.users.extendoid = import ./extendoid.nix { inherit pkgs config lib; };
    programs.fish.enable = config.users.users.extendoid.shell == pkgs.fish;
  };
}
