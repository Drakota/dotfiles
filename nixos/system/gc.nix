{ config, pkgs, ... }:

{
  # Limit the number of generations to keep.
  boot.loader.systemd-boot.configurationLimit = 10;

  # Enable automatic garbage collection of old generations.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Optimize storage
  nix.settings.auto-optimise-store = true;
}
