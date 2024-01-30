{
  inputs,
  pkgs,
  nix-darwin,
  nixpkgs-darwin,
  home-manager,
  flake-utils,
  ...
}: let
  constants = import ../helpers/constants.nix;
  buildExtraSpecialArgs = system:
    {
      inherit constants;
      pkgs-darwin = import inputs.nixpkgs-darwin {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    }
    // inputs;
  darwin-hosts = import ./darwin {
    inherit pkgs;
    inherit nix-darwin;
    inherit nixpkgs-darwin;
    inherit home-manager;
    inherit flake-utils;
    inherit buildExtraSpecialArgs;
    inherit inputs;
  };
in
  darwin-hosts
