{ht-fn, ...}: {
  imports =
    (ht-fn.listDirectory ./.)
    ++ [
      ../common/server
      ../common/desktop
      ../common/core.nix
    ];
}
