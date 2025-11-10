{ config, lib, pkgs, ... }:

{
  imports =
    [
    ./utils
    ./users
    ./laptop/xserver
    ./laptop/networking
    ./laptop/utils
    ./boot
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;

  extendoid.xserver.plasma6.enable = true;
  nixosUsers.extendoid = true;

  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    protonvpn-gui
    monero-gui
    chromium
    gnumake
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "25.05";

}

