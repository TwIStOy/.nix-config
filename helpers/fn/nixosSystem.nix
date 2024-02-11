{
  nixpkgs,
  home-manager,
  system,
  specialArgs,
  nixos-modules,
  home-modules,
  agenix,
  ...
}: let
  inherit (specialArgs) username;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    inherit specialArgs;
    modules =
      nixos-modules
      ++ [
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users."${username}" = home-modules;
        }
      ];
  }
