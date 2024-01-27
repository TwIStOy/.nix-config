{mylib, ...}: {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      ../common/server
      ../common/desktop
      ../common/core.nix
    ];
}
