{...}: {
  imports = [
    ../common/server
    ../common/desktop
    ../common/core.nix
    ./core.nix
    ./desktop
  ];
}
