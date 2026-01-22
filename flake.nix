{
  description = "Snaxx NixOS Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in
  {
    # Config NixOS pour ton laptop
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        # Config système
        ./hosts/laptop/default.nix

        # Home Manager comme module NixOS
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.snaxx = import ./home/users/snaxx/default.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
