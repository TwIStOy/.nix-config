{
  self,
  inputs,
  constants,
}: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib {inherit lib;};
  ht-fn = import ../helpers/fn {nixpkgs = inputs.nixpkgs;};
  vars = import ./vars.nix;

  specialArgsForSystem = system:
    {
      inherit (constants) username userfullname useremail;
      inherit mylib;

      pkgs-darwin = import inputs.nixpkgs-darwin {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable =
        import inputs.nixpkgs-unstable
        {
          inherit system;
          config.allowUnfree = true;
        };
      pkgs-stable =
        import inputs.nixpkgs-stable
        {
          inherit system;
          config.allowUnfree = true;
        };
    }
    // inputs;

  allSystemSpecialArgs = mylib.attrs.mapAttrs (_: specialArgsForSystem) constants.allSystemAttrs;

  args = mylib.attrs.mergeAttrsList [
    inputs
    constants
    vars
    {
      inherit self lib mylib ht-fn allSystemSpecialArgs;
    }
  ];
in
  mylib.attrs.mergeAttrsList [
    (import ./darwin.nix args)
    (import ./nixos.nix args)
  ]
