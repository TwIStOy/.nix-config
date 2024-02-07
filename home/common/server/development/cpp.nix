{
  pkgs,
  nur-hawtian,
  ...
}: {
  home.packages =
    (with pkgs; [
      gcc
      cmake
      cmake-language-server
      llvmPackages_17.clang-unwrapped
    ])
    ++ [
      nur-hawtian.packages.${pkgs.system}.gersemi
    ];
}
