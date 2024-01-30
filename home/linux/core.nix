{
  username,
  pkgs,
  lib,
  ...
}: {
  home.homeDirectory = lib.mkForce "/home/${username}";

  home.packages = with pkgs; [
    iotop
    iftop

    tcpdump
  ];

  programs.ssh = {
    enable = true;
    startAgent = true;
  };
}
