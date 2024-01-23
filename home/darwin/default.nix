{ mylib
, ...
}: {
  imports = [
    ../common/server
    ../common/core.nix
    ./core.nix
    ./shell.nix
  ];
}
