{ config, lib, pkgs, user, ... }:

{ 
  imports = [ 
    ./docker.nix
  ];
                         
  environment.systemPackages = with pkgs; [

    rnix-lsp # language support for nix

    nodejs

    dotnet-sdk

    jetbrains.datagrip
    jetbrains.webstorm
    jetbrains.idea-ultimate
    jetbrains.rider

    ghc
    stack
    haskell-language-server

    exercism

    maven
    jdk

  ];

}