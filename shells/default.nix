{
  inputs,
  system,
  ...
}: {
  cpp-env = import ./cpp-env.nix {inherit inputs system;};
  agora-dev = import ./agora-dev.nix {inherit inputs system;};
}
