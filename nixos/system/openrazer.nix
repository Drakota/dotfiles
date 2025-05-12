{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  # Enable OpenRazer and Xone support
  hardware.openrazer.enable = true;
  # Can't use with linuxPackages_cachyos at the moment
  # https://github.com/chaotic-cx/nyx/issues/958
  # hardware.xone.enable = true;
  users.users.drakota.extraGroups = [ "openrazer" ];
}
