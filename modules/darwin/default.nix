{mylib, ...}: {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      ../common.nix
    ];
}
