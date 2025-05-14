{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./vscode.nix
  ];

  # Common packages to install
  home.packages = with pkgs; [
    vim
    wget
    spotify
    microsoft-edge
    neofetch
    nixfmt-rfc-style
    nixd
    discord
    gitkraken
    tmux
    nvtopPackages.nvidia
    htop
  ];
}
