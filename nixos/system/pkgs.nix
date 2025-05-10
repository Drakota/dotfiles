{ config, pkgs, ... }:

{
  # Program configuration that are not configured in the home-manager module

  programs.gamemode = {
    enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
}
