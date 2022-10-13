{
  description = "Basic configuration Nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:

    let
      user = "facu";
    in {

      nixosConfigurations=(                                               
        import ./hosts {                                                   
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user;   # Also inherit home-manager so it does not need to be defined here.
        }
      );

  };
}