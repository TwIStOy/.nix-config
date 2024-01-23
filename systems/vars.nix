{
  darwin_yamato_modules = {
    darwin-modules = [
      ../hosts/darwin_yamato
      ../modules/darwin
    ];
    home-module.imports = [
      ../hosts/darwin_yamato/home.nix
      ../home/darwin
    ];
  };
  darwin_yukikaze_modules = {
    darwin-modules = [
      ../hosts/darwin_yukikaze
      ../modules/darwin
    ];
    home-module.imports = [
      ../hosts/darwin_yukikaze/home.nix
      ../home/darwin
    ];
  };
}
