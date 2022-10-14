{ lib, inputs, nixpkgs, user, home-manager, ... }:

let
  system = "x86_64-linux";                                  # System architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{

  virtualBox = lib.nixosSystem {                              
    inherit system;
    specialArgs = { inherit inputs user; }; # Pass flake variable
    modules = [                                             # Modules that are used.
      ./virtualBox
      ./configuration.nix
      ../nixosModules/dev

      home-manager.nixosModules.home-manager {              # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };  # Pass flake variable
        home-manager.users.${user} = {
          imports = [(import ./home.nix)]; 
          # ++ [(import ./desktop/home.nix)];
        };
      }
    ];
  };

  vmware = lib.nixosSystem {                              
    inherit system;
    specialArgs = { inherit inputs user; }; # Pass flake variable
    modules = [                                             # Modules that are used.
      ./vmware
      ./configuration.nix
      ../nixosModules/dev

      home-manager.nixosModules.home-manager {              # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };  # Pass flake variable
        home-manager.users.${user} = {
          imports = [(import ./home.nix)]; 
          # ++ [(import ./desktop/home.nix)];
        };
      }
    ];
  };

}