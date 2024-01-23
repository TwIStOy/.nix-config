{ mylib
, ...
}: {
  imports = [
    ../common/core.nix
    ./core.nix
    ./shell.nix
  ];
}
