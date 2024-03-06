{ht-fn, ...}: {
  imports =
    (ht-fn.listDirectory ./.)
    ++ [
      ../modules
      ../common/server
      ../common/desktop
      ../common/core.nix
    ];
}
