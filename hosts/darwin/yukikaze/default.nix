{
  darwin-modules = [
    ../../../modules/darwin
    ../../../modules/common.nix
    ./modules.nix
  ];
  home-modules.imports = [
    ../../../home/darwin
    ./home.nix
  ];
}
