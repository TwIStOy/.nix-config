{
  nix-darwin,
  nixpkgs-darwin,
  home-manager,
  flake-utils,
  buildExtraSpecialArgs,
  inputs,
  agenix,
  ht-fn,
  ...
}: let
  buildSystem = {
    host-modules,
    system,
  }:
    ht-fn.darwinSystem (
      inputs.nixpkgs.lib.attrsets.mergeAttrsList [
        {
          inherit nix-darwin;
          inherit home-manager;
          inherit inputs;
          inherit ht-fn;
          inherit agenix;
          nixpkgs = nixpkgs-darwin;
        }
        host-modules
        {
          inherit system;
          specialArgs = buildExtraSpecialArgs system;
        }
      ]
    );
in {
  darwinConfigurations = {
    yamato = buildSystem {
      system = flake-utils.lib.system.x86_64-darwin;
      host-modules = import ./yamato;
    };
    yukikaze = buildSystem {
      system = flake-utils.lib.system.aarch64-darwin;
      host-modules = import ./yukikaze;
    };
  };
}
