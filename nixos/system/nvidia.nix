{ config, pkgs, ... }:

{
  # Enable the NVIDIA kernel modules
  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_drm"
    "nvidia_uvm"
  ];
  boot.kernelModules = [
    "nvidia"
    "nvidia_drm"
  ];

  # Set the NVIDIA kernel module options
  boot.extraModprobeConfig = ''
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
    options nvidia NVreg_TemporaryFilePath=/var/tmp
    options nvidia NVreg_EnableGpuFirmware=0
    options nvidia_drm modeset=1
    options nvidia_drm fbdev=1
  '';

  # Enable OpenGL
  hardware.graphics.enable = true;

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
    open = true;

    # Enable the NVIDIA settings daemon
    nvidiaSettings = true;

    # Set the driver to the latest production version
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
