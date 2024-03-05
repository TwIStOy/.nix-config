{
  pkgs,
  nur-hawtian,
  ...
}: let
  inherit (pkgs) gcc;
  nixAwareClangdConfig = pkgs.stdenv.mkDerivation {
    name = "nix-aware-clangd-config";

    nativeBuildInputs = [gcc];

    dontUnpack = true;
    phases = ["installPhase"];

    installPhase = ''
      mkdir -p $out/dist
      ($CXX -xc++ -E -v /dev/null) 2>&1 | awk 'BEGIN { incsearch = 0} /^End of search list/ { incsearch = 0 } { if(incsearch) { print $0 }} /^#include </ { incsearch = 1 }' | sed 's/^[[:space:]]*\(.*\)/"-isystem","\1"/' | tr '\n' ' ' | tr ' ' ',' | sed 's/,$//' > $out/dist/extra_args
    '';
  };
in {
  home.packages =
    [
      gcc
      nixAwareClangdConfig
    ]
    ++ (with pkgs; [
      cmake
      cmake-language-server
      llvmPackages_17.clang-unwrapped
    ])
    ++ [
      nur-hawtian.packages.${pkgs.system}.gersemi
    ];

  # generate clangd user configuration file
  xdg.configFile."clangd/config.yaml" = {
    text = ''
      CompileFlags:
        Compiler: ${gcc}/bin/g++
        Add: [${builtins.readFile "${nixAwareClangdConfig}/dist/extra_args"}]
      Diagnostics:
        Suppress: "builtin_definition"
    '';
    force = true;
  };
}
