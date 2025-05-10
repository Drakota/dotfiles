{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          github.copilot
          github.github-vscode-theme
          jnoortheen.nix-ide
        ];
      };
    };
  };
}
