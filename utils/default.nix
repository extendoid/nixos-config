{config, lib, pkgs, ... }: 
{
  imports = 
  [
    ./ledger.nix
    ./fingerprint.nix
  ];

  # BIOS Update
  services.fwupd.enable = true;
}
