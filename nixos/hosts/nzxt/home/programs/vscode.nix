{ config, pkgs, ... }:

let
  settingsPath = "${config.home.homeDirectory}/dotfiles/.vscode/settings.json";
  keybindingsPath = "${config.home.homeDirectory}/dotfiles/.vscode/keybindings.json";
  userTasksFile = "${config.home.homeDirectory}/dotfiles/.vscode/tasks.json";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
      version = "1.100.0";
      src = pkgs.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        sha256 = "7a0bf28cca664b2514a383dd1e9391340039a5a6d554a499767ef3a916b5fe43";
      };
    });
    profiles = {
      default = {
        userSettings = config.lib.file.mkOutOfStoreSymlink settingsPath;
        keybindings = config.lib.file.mkOutOfStoreSymlink keybindingsPath;
        userTasks = config.lib.file.mkOutOfStoreSymlink userTasksFile;
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          github.copilot
          github.copilot-chat
          github.github-vscode-theme
          jnoortheen.nix-ide
          eamodio.gitlens
        ];
      };
    };
  };
}
