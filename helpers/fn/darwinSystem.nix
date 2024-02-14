{
  nix-darwin,
  system,
  agenix,
  specialArgs,
  home-manager,
  darwin-modules,
  home-modules, # modules for home-manager
  ...
}: let
  inherit (specialArgs) username;
in
  nix-darwin.lib.darwinSystem {
    inherit system;
    inherit specialArgs;
    modules =
      darwin-modules
      ++ [
        # enable home-manager
        home-manager.darwinModules.home-manager
        agenix.darwinModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users."${username}" = home-modules;
        }
      ];
  }
