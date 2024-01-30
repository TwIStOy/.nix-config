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
    btop

    tcpdump
  ];

  programs.ssh = {
    enable = true;
  };
}
