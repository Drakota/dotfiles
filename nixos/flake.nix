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
    let
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };
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

            # Add overlays for my custom packages
            nixpkgs.overlays = [
              self.overlays.additions
              self.overlays.modifications
            ];
          }
          ./hardware-configuration.nix
          ./hosts/nzxt/system
          chaotic.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            # Enable the Home Manager module
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.drakota = import ./hosts/nzxt/home;
          }
        ];
      };
    };
}
