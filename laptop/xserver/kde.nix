{ config, lib, ... }:
let
  cfg = config.extendoid.xserver;
in 
{
  options = { 
    extendoid.xserver.plasma6.enable = lib.mkEnableOption "Enables plasma6";
  };

  config = lib.mkIf cfg.plasma6.enable {
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
