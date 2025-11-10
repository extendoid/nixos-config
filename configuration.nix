{ config, lib, pkgs, ... }:

{
  imports =
    [
    ./utils
    ./users
    ./laptop/xserver
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "gamma"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "fr";
    useXkbConfig = true; # use xkb.options in tty.
  };

  extendoid.xserver.plasma6.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  nixosUsers.extendoid = true;

  programs.firefox.enable = true;
  programs.chromium.enable = true;
  services.tor = {
    enable = true;
    client.enable = true;
  };
  
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

  services.openssh.enable = true;

  system.stateVersion = "25.05";

}

