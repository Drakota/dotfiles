{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  # Enable OpenRazer and Xone support
  hardware.openrazer.enable = true;
  hardware.xone.enable = true;
  # Disable xpad-noone, not using older Xbox controllers
  hardware.xpad-noone.enable = false;
  users.users.drakota.extraGroups = [ "openrazer" ];
}
