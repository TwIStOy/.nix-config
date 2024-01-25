{config, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    system.enable = true;
  };
}
