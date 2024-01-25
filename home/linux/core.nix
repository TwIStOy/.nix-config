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

  users.users."${username}" = {
    shell = pkgs.fish;
  };
}
