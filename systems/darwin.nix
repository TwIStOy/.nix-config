args:
with args;
with mylib;
with allSystemAttrs; let
  base_arg = {
    inherit nix-darwin home-manager;
    nixpkgs = nixpkgs-darwin;
  };
in
{
  darwinConfigurations = {
    yamato = macosSystem (
      attrs.mergeAttrsList [
        base_arg
        darwin_yamato_modules
        {
          system = allSystemAttrs.x64_darwin;
          specialArgs = allSystemSpecialArgs.x64_darwin;
        }
      ]
    );
  };
}
