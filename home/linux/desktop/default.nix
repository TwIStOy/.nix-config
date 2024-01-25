{
  config,
  pkgs,
  anyrun,
  ...
}: {
  imports = [
    anyrun.homeManagerModules.default

    ./anyrun.nix
    ./hyprland.nix
  ];
}
