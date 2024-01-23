{ mylib
, ...
}: {
  imports = [
    ../common/core.nix
    ./core.nix
  ];
}
