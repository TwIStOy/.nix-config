{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible

    lazydocker # docker TUI
    dive # explore layers in docker images
  ];
}
