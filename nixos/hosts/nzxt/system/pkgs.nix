{ pkgs, ... }:
let
  startscript = pkgs.writeShellScript "gamemode-start" ''
    ${pkgs.nvidia_oc}/bin/nvidia_oc set --index 0 --freq-offset 100 --mem-offset 500
  '';
  endscript = pkgs.writeShellScript "gamemode-end" ''
    ${pkgs.nvidia_oc}/bin/nvidia_oc set --index 0 --freq-offset 0 --mem-offset 0
  '';
in
{
  # Program configuration that are not configured in the home-manager module
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
      custom = {
        start = "${startscript}";
        end = "${endscript}";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    nvidia_oc
  ];
  users.users.drakota.extraGroups = [ "gamemode" ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
