{
  inputs,
  nixpkgs,
  nix-darwin,
  nixpkgs-darwin,
  home-manager,
  agenix,
  flake-utils,
  hyperSelf,
  ...
}: let
  constants = import ../helpers/constants.nix;
  ht-fn = import ../helpers/fn {inherit (inputs) nixpkgs;};
  buildExtraSpecialArgs = system:
    {
      inherit (constants) username userfullname useremail;
      inherit ht-fn system hyperSelf;
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
    inherit
      nix-darwin
      nixpkgs-darwin
      home-manager
      agenix
      flake-utils
      buildExtraSpecialArgs
      inputs
      ht-fn
      hyperSelf
      ;
  };
  nixos-hosts = import ./nixos {
    inherit
      nixpkgs
      home-manager
      agenix
      flake-utils
      buildExtraSpecialArgs
      inputs
      ht-fn
      hyperSelf
      ;
  };
in
  darwin-hosts
  // nixos-hosts
