{
  description = "NixOS configuration with flakes";

  inputs = {
    # Nixpkgs Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
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
