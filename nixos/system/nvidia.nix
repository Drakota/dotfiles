{ config, pkgs, ... }:

{
  # Enable early KMS for NVIDIA
  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_drm"
    "nvidia_uvm"
  ];

  # Enable the NVIDIA kernel modules
  boot.kernelModules = [
    "nvidia"
    "nvidia_drm"
  ];

  # Blacklist nouveau to avoid conflicts
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Set the NVIDIA kernel module options
  boot.kernelParams = [
    # Enable mode setting for Wayland
    "nvidia-drm.modeset=1"
    # Improves resume after sleep
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    # Performance/power optimizations
    "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerLevel=0x3;PowerMizerDefault=0x3;PowerMizerDefaultAC=0x3"
  ];

  # Environment variables for better compatibility
  environment.variables = {
    # Hardware video acceleration
    LIBVA_DRIVER_NAME = "nvidia";
    # Force Wayland
    XDG_SESSION_TYPE = "wayland";
    # Graphics backend for Wayland
    GBM_BACKEND = "nvidia-drm";
    # Use Nvidia driver for GLX
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Fix for cursors on Wayland
    WLR_NO_HARDWARE_CURSORS = "1";
    # Wayland support for Electron apps
    NIXOS_OZONE_WL = "1";
    # Enable G-Sync if available
    __GL_GSYNC_ALLOWED = "1";
    # Enable VRR (Variable Refresh Rate)
    __GL_VRR_ALLOWED = "1";
    # Fix for some issues with Hyprland
    WLR_DRM_NO_ATOMIC = "1";
    # Configuration for new driver
    NVD_BACKEND = "direct";
    # Wayland support for Firefox
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Enable the NVIDIA driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # NVIDIA settings
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Disable the NVIDIA power management
    powerManagement.enable = false;

    # Disable the NVIDIA fine-grained power management
    powerManagement.finegrained = false;

    # Use the NVIDIA open source kernel module
    open = false;

    # Enable the NVIDIA settings daemon
    nvidiaSettings = true;

    # Set the driver to the latest production version
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  # Enhanced graphics support
  hardware.graphics = {
    enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
      mesa
      egl-wayland
      vulkan-loader
      vulkan-validation-layers
      libva
    ];
  };
}
