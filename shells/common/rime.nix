{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  devenv = inputs.devenv;
  stdenv = pkgs.stdenv;
  lib = pkgs.lib;
in
  devenv.lib.mkShell {
    inherit inputs pkgs;

    modules = [
      (
        {pkgs, ...}: {
          packages = with pkgs; [
            pkg-config
            librime
            llvmPackages_17.clang-unwrapped
            rustPlatform.bindgenHook
          ];

          languages.rust.enable = true;
          languages.c.enable = true;

          enterShell = ''
            export BINDGEN_EXTRA_CLANG_ARGS="$(< ${stdenv.cc}/nix-support/libc-crt1-cflags) \
            $(< ${stdenv.cc}/nix-support/libc-cflags) \
            $(< ${stdenv.cc}/nix-support/cc-cflags) \
            $(< ${stdenv.cc}/nix-support/libcxx-cxxflags) \
            ${lib.optionalString stdenv.cc.isClang "-idirafter ${stdenv.cc.cc}/lib/clang/${lib.getVersion stdenv.cc.cc}/include"} \
            ${lib.optionalString stdenv.cc.isGNU "-isystem ${stdenv.cc.cc}/include/c++/${lib.getVersion stdenv.cc.cc} -isystem ${stdenv.cc.cc}/include/c++/${lib.getVersion stdenv.cc.cc}/${stdenv.hostPlatform.config} -idirafter ${stdenv.cc.cc}/lib/gcc/${stdenv.hostPlatform.config}/${lib.getVersion stdenv.cc.cc}/include"}
            "
          '';
        }
      )
    ];
  }
