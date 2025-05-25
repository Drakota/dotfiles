{ inputs, ... }:

{
  # Pulls custom packages from the 'pkgs' directory
  additions = final: prev: import ../pkgs { pkgs = final; };

  # Overlays to apply to the Nixpkgs package set
  modifications = final: prev: {
    # Add a stable version of Nixpkgs with unfree packages allowed
    stable = import inputs.nixpkgs-stable {
      system = prev.system;
      # Allow unfree packages
      config.allowUnfree = true;
    };
  };
}
