{ self
, inputs
, constants
,
}:
let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib { inherit lib; };
  vars = import ./vars.nix;

  specialArgsForSystem = system:
    {
      inherit (constants) username userfullname useremail;
      inherit mylib;

      pkgs-unstable = import inputs.nixpkgs-unstable
        {
          inherit system;
          config.allowUnfree = true;
        };
      pkgs-stable = import inputs.nixpkgs-stable
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
      inherit self lib mylib allSystemSpecialArgs;
    }
  ];
in
mylib.attrs.mergeAttrsList [
  (import ./darwin.nix args)
]
