# Common configuration for both darwin and nixos
{...}: {
  imports = [
    ./core.nix
    ./secrets.nix
  ];
}
