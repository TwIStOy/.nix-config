{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages =
    (with pkgs; [
      gdb
      direnv
    ])
    ++ (with pkgs-unstable; [
      jetbrains.gateway
    ]);
}
