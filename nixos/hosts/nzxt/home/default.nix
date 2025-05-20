{ config, ... }:
let
  tmuxConfPath = "${config.home.homeDirectory}/dotfiles/.tmux.conf";
in
{
  imports = [
    ./programs
    ./fonts.nix
    ./autostart.nix
  ];

  # User configuration
  home.username = "drakota";
  home.homeDirectory = "/home/drakota";

  # Handle dotfiles
  home.file = {
    ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink tmuxConfPath;
  };

  # Bash configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      open = "xdg-open";
      nrs = "sudo nixos-rebuild switch";
      nrsu = "sudo nixos-rebuild switch --upgrade && nix store diff-closures /run/*-system";
      nup = "sudo nix flake update --flake /etc/nixos";
      ngc = "sudo nix-collect-garbage -d";
      nxc = "$EDITOR /etc/nixos";
    };
    sessionVariables = {
      # Set the default editor
      EDITOR = "code";
      VISUAL = "code";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
