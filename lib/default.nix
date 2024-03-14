{nixpkgs}: {
  paths = import ./paths.nix {
    inherit nixpkgs;
  };
}
