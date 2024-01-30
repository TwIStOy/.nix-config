{
  nixos-modules = [
    ../../../modules/nixos
    ../../../modules/common.nix
    ./modules.nix
  ];
  home-modules.imports = [
    ../../../home/linux/server.nix
    ./home.nix
  ];
}
