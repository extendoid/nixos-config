{ ... }:
{
  networking.hostName = "gamma";
  networking.networkmanager.enable = true;

  programs.firefox.enable = true;
  programs.chromium.enable = true;

  services.tor = {
    enable = true;
    client.enable = true;
  };

  services.openssh.enable = true;
}
