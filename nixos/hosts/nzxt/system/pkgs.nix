{ pkgs, ... }:

{
  # Program configuration that are not configured in the home-manager module
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1;
        nv_core_clock_mhz_offset = 150;
        nv_mem_clock_mhz_offset = 400;
      };
    };
  };
  users.users.drakota.extraGroups = [ "gamemode" ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
