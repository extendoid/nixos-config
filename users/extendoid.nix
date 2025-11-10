{ pkgs, config, lib, ... }:
let
  groupExists = grp: builtins.hasAttr grp config.users.groups;
  addIfExists = group: lib.optional (groupExists group) group;
in
{
  shell = pkgs.fish;
  home = "/home/extendoid";
  isNormalUser = true;
  extraGroups = [ "wheel" "tty" "audio" "disk" "networkmanager" ] ++ addIfExists "docker";
}
