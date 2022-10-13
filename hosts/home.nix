{ config, lib, pkgs, user, ... }:

{ 
  imports =                                   # Home Manager Modules
    # (import ../modules/editors) ++
    # (import ../modules/programs) ++
    # (import ../modules/services) ++
    (import ../modules/shell);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
     git
     vscode 
    ];
    
    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
  };

}