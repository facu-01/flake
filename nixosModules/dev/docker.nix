{ config, lib, pkgs, user, ... }:

{ 
                          
environment.systemPackages = with pkgs; [
    docker-compose
  ];

  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = [ "docker" ];
  

}