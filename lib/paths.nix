{nixpkgs}: let
  # check if the file is a nix file, but skip `default.nix`
  isNixFile = path:
    path != "default.nix" && nixpkgs.lib.strings.hasSuffix ".nix" path;
  # check if the directory contains a default.nix file
  directoryContainsDefaultNix = path:
    builtins.pathExists
    (path + "/default.nix");
  # check if the attribute is a nix module
  mkIfNixModule = root: path: filetype:
    (filetype == "directory" && directoryContainsDefaultNix (root + path))
    || (filetype == "regular" && isNixFile path);
in {
  readModules = path: let
    isNixModule = mkIfNixModule path;
  in
    builtins.map
    (f: (path + "/${f}"))
    (
      builtins.attrNames
      (nixpkgs.lib.attrsets.filterAttrs isNixModule (builtins.readDir path))
    );
}
