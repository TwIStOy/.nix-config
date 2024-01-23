{
  darwin_yamato_modules = {
    darwin-modules = [
      ../hosts/darwin_yamato
      ../modules/darwin
    ];
    homemanager-imports = [
      ../hosts/darwin_yamato/home.nix
      ../home/darwin
    ];
  };
}
