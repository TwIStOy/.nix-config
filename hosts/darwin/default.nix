{
  nix-darwin,
  nixpkgs-darwin,
  home-manager,
  flake-utils,
  buildExtraSpecialArgs,
  inputs,
  ...
}: let
  darwinSystem = import ../../helpers/fn/darwinSystem.nix;
  yamato_modules = import ./yamato;
  buildSystem = {
    host-modules,
    system,
  }:
    darwinSystem (
      inputs.nixpkgs.lib.attrsets.mergeAttrsList [
        {
          inherit nix-darwin home-manager inputs;
          nixpkgs = nixpkgs-darwin;
        }
        host-modules
        rec {
          inherit system;
          specialArgs = buildExtraSpecialArgs system;
        }
      ]
    );
in {
  darwinConfigurations = {
    yamato = buildSystem {
      system = flake-utils.lib.system.x86_64-darwin;
      host-modules = yamato_modules;
    };
  };
}
