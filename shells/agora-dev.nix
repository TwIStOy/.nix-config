{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
  pkgs.mkShell rec {
    packages = with pkgs; [
      just
      stdenv.cc.cc
      cmake
      python3
      pkg-config
      llvmPackages_17.clang-unwrapped

      # libraries
      abseil-cpp
      range-v3
      glibc
    ];

    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath packages;
    CPPFLAGS = "-isystem ${pkgs.abseil-cpp}/include -isystem ${pkgs.range-v3}/include";
    AGORA_CC_PATH = "${pkgs.stdenv.cc.cc}";
    AGORA_CC_VERSION = "${pkgs.stdenv.cc.cc.version}";
    AGORA_PLATFORM = "${pkgs.stdenv.hostPlatform.config}";

    shellHook = ''
      echo "Agora-dev ${pkgs.abseil-cpp} ${pkgs.range-v3} ${pkgs.glibc.dev}"
      exec fish
    '';
  }
