{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: let
  cfg = config.suits.development.build-tools;
in {
  options.suits.development.built-tools = {
    enable = lib.mkEnableOption "Enable development build tools";

    unstable = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "List of packages use unstable version";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = let
      inherit (cfg) unstable;
      resolvePkg = pkg:
        if (builtins.elem pkg unstable)
        then pkgs-unstable.${pkg}
        else pkgs.${pkg};
      ret = [
        "gnumake" # for makefile
        "ninja" # for ninja file
        "pkg-config" # find library
        "cmake" # generate makefile/ninja file
      ];
      retPkg = builtins.map resolvePkg ret;
    in
      retPkg;
  };
}
