{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    ninja
    pkg-config
  ];
}
