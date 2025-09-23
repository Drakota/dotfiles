{ pkgs, ... }:

{
  nvibrant_git = pkgs.callPackage ./nvibrant-git { };
  stremio_linux_shell_git = pkgs.callPackage ./stremio-linux-shell-git { };
}
