{ pkgs, ... }:
let
  nvibrantAutostart = pkgs.writeText "nvibrant.desktop" ''
    [Desktop Entry]
    Type=Application
    Name=nVibrant
    Exec=nvibrant 1023 1023 1023 1023 1023 1023 1023
    NoDisplay=true
  '';
in
{
  xdg.enable = true;
  # Autostart desktop files
  xdg.autostart = {
    enable = true;
    entries = [ nvibrantAutostart ];
  };
}
