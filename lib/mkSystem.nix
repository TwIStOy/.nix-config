{
  inputs,
  system,
}: let
  hasSuffix = inputs.nixpkgs.lib.strings.hasSuffix;
  isDarwin = hasSuffix "darwin" system;
  constants = import ../constants.nix;
  mkSystem =
    if isDarwin
    then inputs.nix-darwin.lib.darwinSystem
    else inputs.nixpkgs.lib.nixosSystem;

  commonModules = [];
  commonHMModules = [];
  darwinModules = [
    inputs.home-manager.darwinModules.home-manager
    inputs.agenix.darwinModules.default
  ];
  nixosModules = [];
in
  mkSystem {
    inherit inputs system;

    modules =
    (if isDarwin then darwinModules else nixosModules)
    ([
    ]);
  }
