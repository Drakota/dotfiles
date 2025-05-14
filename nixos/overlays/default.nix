{ inputs, ... }:

{
  # Pulls custom packages from the 'pkgs' directory
  additions = final: prev: import ../pkgs { pkgs = final; };

  # Overlays to apply to the Nixpkgs package set
  modifications = final: prev: {
  };
}
