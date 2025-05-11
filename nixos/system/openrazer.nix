{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  # Enable OpenRazer and Xone support
  hardware.openrazer.enable = true;
  hardware.xone.enable = true;
  users.users.drakota.extraGroups = [ "openrazer" ];
}
