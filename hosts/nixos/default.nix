{
  inputs,
  home-manager,
  buildExtraSpecialArgs,
  flake-utils,
  nixpkgs,
  ht-fn,
  agenix,
  ...
}: let
  buildSystem = {
    host-modules,
    system,
  }:
    ht-fn.nixosSystem (
      inputs.nixpkgs.lib.attrsets.mergeAttrsList [
        {
          inherit home-manager;
          inherit inputs;
          inherit ht-fn;
          inherit nixpkgs;
          inherit agenix;
        }
        host-modules
        {
          inherit system;
          specialArgs = buildExtraSpecialArgs system;
        }
      ]
    );
in {
  nixosConfigurations = {
    poi = buildSystem {
      system = flake-utils.lib.system.x86_64-linux;
      host-modules = import ./poi;
    };
  };
}
