{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./anyrun.nix
    ./hyprland.nix
  ];
}
