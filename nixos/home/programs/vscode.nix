{ config, pkgs, ... }:

let
  stripComments =
    jsonString:
    let
      # Split the input JSON string into lines and filter out non-string elements
      lines = builtins.filter (x: builtins.isString x) (builtins.split "\n" jsonString);

      # Filter out lines that are comments or contain inline comments
      cleanLines = builtins.filter (
        line:
        let
          trimmedLine = builtins.replaceStrings [ "\t" " " ] [ "" "" ] line;
        in
        # Skip lines that are empty or start with // or are /* */ comments
        trimmedLine != ""
        && !(builtins.match "^[[:space:]]*//.*" trimmedLine != null)
        && !(builtins.match "^[[:space:]]*/\\*.*\\*/[[:space:]]*$" trimmedLine != null)
      ) lines;

      # Join the lines back into a string
      cleanJson = builtins.concatStringsSep "\n" cleanLines;
    in
    cleanJson;

  settingsJson = builtins.fromJSON (stripComments (builtins.readFile ../../../.vscode/settings.json));
  keybindingsJson = builtins.fromJSON (
    stripComments (builtins.readFile ../../../.vscode/keybindings.json)
  );
in
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        userSettings = settingsJson;
        keybindings = keybindingsJson;
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
