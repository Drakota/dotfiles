{ config, ... }:
let
  tmuxConfPath = "${config.home.homeDirectory}/dotfiles/.tmux.conf";
in
{
  imports = [
    ./programs/default.nix
    ./fonts.nix
  ];

  # User configuration
  home.username = "drakota";
  home.homeDirectory = "/home/drakota";

  # Handle dotfiles
  home.file = {
    ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink tmuxConfPath;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
