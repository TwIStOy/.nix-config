{
  pkgs,
  hyprland,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    # gammastep/wallpaper-switcher need this to be enabled.
    systemd.enable = true;
  };
}
