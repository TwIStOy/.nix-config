{
  darwin_yamato_modules = {
    darwin-modules = [
      ../hosts/darwin_yamato
      ../modules/darwin
      ../modules/common.nix
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
      ../modules/common.nix
    ];
    home-module.imports = [
      ../hosts/darwin_yukikaze/home.nix
      ../home/darwin
    ];
  };
  nixos_poi_modules = {
    nixos-modules = [
      ../hosts/nixos_poi
      ../modules/nixos
      ../modules/common.nix
    ];
    home-module.imports = [
      ../hosts/nixos_poi/home.nix
      ../home/linux/server.nix
    ];
  };
}
