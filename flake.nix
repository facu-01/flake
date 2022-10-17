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

      isNixFile = s: s.type == "directory" || nixpkgs.lib.strings.hasSuffix ".nix" s.name;

      isDisabled = s:
        nixpkgs.lib.strings.hasInfix "disabled"
          (nixpkgs.lib.strings.toLower s.name);


      scanDirectory = path:
        nixpkgs.lib.lists.flatten
          (builtins.map
            (s:
              if s.type == "directory"
              then scanDirectory (path + "/${s.name}")
              else "${path}/${s.name}"
            )
            (builtins.filter (file: (isNixFile file) && !(isDisabled file))
              (nixpkgs.lib.attrsets.mapAttrsToList
                (name: type: {
                  inherit name type;
                })
                (builtins.readDir path))));

    in
    {

      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user scanDirectory; # Also inherit home-manager so it does not need to be defined here.
        }
      );

    };
}
