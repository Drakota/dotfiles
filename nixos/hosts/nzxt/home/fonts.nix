{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cascadia-code
  ];

  fonts.fontconfig.enable = true;
}
