{ config, pkgs, ... }:
let
  homeDirectory = "/home/extendoid";
in
rec {
  home = {
    username = "extendoid";
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
  };
}
