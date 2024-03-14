{
  inputs,
  nixpkgs,
  nix-darwin,
  nixpkgs-darwin,
  home-manager,
  agenix,
  flake-utils,
  ...
}: let
  constants = import ../helpers/constants.nix;
  ht-fn = import ../helpers/fn {inherit (inputs) nixpkgs;};
  myUtils = import ../lib {inherit (inputs) nixpkgs;};
  buildExtraSpecialArgs = system:
    {
      inherit (constants) username userfullname useremail;
      inherit ht-fn system myUtils;
      pkgs-darwin = import inputs.nixpkgs-darwin {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import inputs.nixpkgs-unstable {
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
      myUtils
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
      myUtils
      ;
  };
in
  darwin-hosts
  // nixos-hosts
