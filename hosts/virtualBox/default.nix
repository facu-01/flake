{ lib, inputs, nixpkgs, home-manager, ... }:

{
imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Argentina/Mendoza";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.utf8";
    LC_IDENTIFICATION = "es_AR.utf8";
    LC_MEASUREMENT = "es_AR.utf8";
    LC_MONETARY = "es_AR.utf8";
    LC_NAME = "es_AR.utf8";
    LC_NUMERIC = "es_AR.utf8";
    LC_PAPER = "es_AR.utf8";
    LC_TELEPHONE = "es_AR.utf8";
    LC_TIME = "es_AR.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "es";
    xkbVariant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
 # security.rtkit.enable = true;
 # services.pipewire = {
 #   enable = true;
 #   alsa.enable = true;
 #   alsa.support32Bit = true;
 #   pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
 # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;


}