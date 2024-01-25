args:
with args;
with mylib;
with allSystemAttrs; let
  base_args = {
    inherit home-manager;
    inherit nixpkgs;
  };
in
{
  nixosConfigurations = {
    poi = nixosSystem attrs.mergeAttrsList [
      base_args
      nixos_poi_modules
      {
        system = allSystemAttrs.aarch64_system;
        specialArgs = allSystemSpecialArgs.aarch64_system;
      }
    ];
  };
}