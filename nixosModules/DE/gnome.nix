{ config, lib, pkgs, user, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "es";
    xkbVariant = "nodeadkeys";
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-shell-extensions
    gnomeExtensions.appindicator
    gnomeExtensions.pop-shell
  ];

  services.gnome.core-utilities.enable = true;

}






