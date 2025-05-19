{ config, pkgs, ... }:

let
  settingsPath = "${config.home.homeDirectory}/dotfiles/.vscode/settings.json";
  keybindingsPath = "${config.home.homeDirectory}/dotfiles/.vscode/keybindings.json";
  userTasksFile = "${config.home.homeDirectory}/dotfiles/.vscode/tasks.json";
in
{
  programs.vscode = {
    enable = true;
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
