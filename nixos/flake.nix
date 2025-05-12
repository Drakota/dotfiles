{
  description = "NixOS configuration with flakes";

  inputs = {
    # Nixpkgs Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Nyxpkgs Unstable
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      chaotic,
      ...
    }:

    {
      nixosConfigurations.nzxt = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          {
            # Nix experimental features
            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];
          }
          ./hardware-configuration.nix
          ./system/default.nix
          home-manager.nixosModules.home-manager
          chaotic.nixosModules.default
          {
            # Enable the Home Manager module
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.drakota = import ./home/default.nix;
          }
        ];
      };
    };
}
