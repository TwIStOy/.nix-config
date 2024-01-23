{ mylib
, ...
}: {
  imports = [
    ../common.nix
    ./app.nix
  ];
}
