{ lib, inputs, nixpkgs, user, home-manager, scanDirectory, ... }:

let
  system = "x86_64-linux";                                  # System architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{

  virtualBox = let currentHost = "virtualBox"; in
    lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs user currentHost scanDirectory; }; # Pass flake variable
      modules = [
        # Modules that are used.
        ./virtualBox
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          # Home-Manager module that is used.
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user currentHost scanDirectory; }; # Pass flake variable
          home-manager.users.${user} = {
            imports = [ (import ./home.nix) ];
            # ++ [(import ./desktop/home.nix)];
          };
        }
      ];
    };

  vmware = let currentHost = "vmware"; in
    lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs user currentHost; }; # Pass flake variable
      modules = [
        # Modules that are used.
        ./vmware
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          # Home-Manager module that is used.
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user currentHost scanDirectory; }; # Pass flake variable
          home-manager.users.${user} = {
            imports = [ (import ./home.nix) ];
            # ++ [(import ./desktop/home.nix)];
          };
        }
      ];
    };

}
