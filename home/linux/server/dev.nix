{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages =
    (with pkgs; [
      gdb
    ])
    ++ (with pkgs-unstable; [
      jetbrains.gateway
    ]);
}
