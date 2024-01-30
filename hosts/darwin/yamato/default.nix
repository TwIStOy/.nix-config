{
  yamato_modules = {
    darwin-modules = [
      ../../modules/darwin
      ../../modules/common.nix
    ];
    home-modules.imports = [
      ../../home/darwin
      ./home.nix
    ];
  };
}
