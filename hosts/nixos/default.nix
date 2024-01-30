{
  inputs,
  home-manager,
  buildExtraSpecialArgs,
  flake-utils,
  nixpkgs,
  ht-fn,
  ...
}: let
  buildSystem = {
    home-modules,
    system,
  }:
    ht-fn.nixosSystem (
      inputs.nixpkgs.lib.attrsets.mergeAttrsList [
        {
          inherit home-manager inputs ht-fn;
          inherit nixpkgs;
        }
        home-modules
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
    };
  };
}
