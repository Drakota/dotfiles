{ config, pkgs, ... }:

{
  imports = [
    ./pkgs.nix
    ./nvidia.nix
    ./openrazer.nix
    ./gc.nix
  ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html)
  system.stateVersion = "25.05";

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set the host name of the system
  networking.hostName = "nzxt";

  # Enables wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "America/Toronto";

  # Set the default locale
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the KDE Plasma 6 desktop environment
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure the keyboard layout in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support
  # services.xserver.libinput.enable = true;

  # Define a user account
  users.users.drakota = {
    isNormalUser = true;
    description = "Jonathan Bouchard";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
