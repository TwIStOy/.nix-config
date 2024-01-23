{mylib, ...}: {
  imports = [
    ../common/server
    ../common/desktop
    ../common/core.nix
    ./core.nix
    ./shell.nix
    ./fish.nix
  ];
}
