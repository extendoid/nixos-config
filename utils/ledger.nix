{ config, lib, pkgs, ... }:
{
  services.udev.packages = [
    pkgs.ledger-udev-rules
  ];

  hardware.ledger.enable = true;
}
