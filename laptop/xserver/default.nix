{ pkgs, config, lib, ... }:
{
  imports = [ ./kde.nix ];
  services.xserver.xkb.layout = "fr"; 
}
