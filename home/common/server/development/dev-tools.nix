{pkgs, ...}: {
  home.packages = with pkgs; [
    # Open-source REST API client
    insomnia
  ];
}
