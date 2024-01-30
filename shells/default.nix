{
  inputs,
  system,
}: {
  cpp-env = import ./cpp-env.nix {inherit inputs system;};
}
