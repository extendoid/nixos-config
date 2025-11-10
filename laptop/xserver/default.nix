{ pkgs, config, lib, ... }:
let
  cfg = config.extendoid.xserver;
in 
{
  imports = [ ./kde.nix ];
  services.xserver.xkb.layout = "fr"; 
}
