{ pkgs, ... }:
{
  networking.hostName = "gamma";
  networking.networkmanager.enable = true;

  programs.firefox.enable = true;
  programs.chromium.enable = true;

  services.tor = {
    enable = true;
    client.enable = true;
    openFirewall = true;
    relay = {
      enable = true;
      role = "relay";
    };
  };
  
  environment.systemPackages = [ pkgs.tor-browser ];

  services.openssh.enable = true;
}
