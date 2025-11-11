{ lib, ... }:
{
  time.timeZone = "Europe/Paris";
  
  i18n.defaultLocale = "fr_FR.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "fr";
    useXkbConfig = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      disableWhileTyping = false;
      clickMethod = "clickfinger";
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="i2c", DRIVERS=="rmi4*", TEST=="power/control", ATTR{power/control}="on"
  '';
}
