{
  nix-darwin,
  nixpkgs-darwin,
  home-manager,
  flake-utils,
  buildExtraSpecialArgs,
  inputs,
  ht-fn,
  ...
}: let
  yamato_modules = import ./yamato;
  buildSystem = {
    host-modules,
    system,
  }:
    ht-fn.darwinSystem (
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
