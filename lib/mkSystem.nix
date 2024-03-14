{
  nixpkgs,
  nix-darwin,
}: let
  hasSuffix = nixpkgs.lib.strings.hasSuffix;
  isDarwin = system: hasSuffix "darwin" system;
  constants = import ../constants.nix;
  mkSystem =
    if isDarwin
    then nix-darwin.lib.darwinSystem
    else nixpkgs.lib.nixosSystem;
in
  mkSystem {
  }
