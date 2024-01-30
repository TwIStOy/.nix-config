{ht-fn, ...}: {
  imports =
    (ht-fn.listDirectory ./.)
    ++ [
      ../common.nix
    ];
}
