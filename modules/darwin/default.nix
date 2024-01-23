{ mylib
, ...
}: {
  imports = [
    ../common.nix
    ./app.nix
    ./core.nix
  ];
}
