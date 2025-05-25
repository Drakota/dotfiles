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
    stable.microsoft-edge
    fastfetch
    nixfmt-rfc-style
    nixd
    discord
    gitkraken
    tmux
    nvtopPackages.nvidia
    htop
    nvibrant_git
    stremio
  ];
}
