{nixpkgs}: {
  paths = import ./paths {
    inherit nixpkgs;
  };
}
