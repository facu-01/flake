{ config, lib, pkgs, user, ... }:

{ 
  imports =[
    ../hmModules/shell
    ../hmModules/git
  ];                               # Home Manager Modules
    # (import ../modules/editors) ++
    # (import ../modules/programs) ++
    # (import ../modules/services) ++
    # (import ../modules/shell);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
     vscode
     google-chrome
    ];
    
    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
  };

}