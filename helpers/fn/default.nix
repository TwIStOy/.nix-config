{nixpkgs}: {
  listDirectory = path:
    builtins.map
    (f: (path + "/${f}"))
    (builtins.attrNames
      (nixpkgs.lib.attrsets.filterAttrs
        (
          path: _type:
            (_type == "directory") # include directories
            || (
              (path != "default.nix") # ignore default.nix
              && (nixpkgs.lib.strings.hasSuffix ".nix" path) # include .nix files
            )
        )
        (builtins.readDir path)));
  darwinSystem = import ./darwinSystem.nix;
  nixosSystem = import ./nixosSystem.nix;
}
