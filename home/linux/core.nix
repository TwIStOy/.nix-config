{
  username,
  pkgs,
  ...
}: {
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    iotop
    iftop

    tcpdump
  ];
}