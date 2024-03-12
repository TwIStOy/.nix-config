{
  inputs,
  system,
  ...
}: {
  cpp-env = import ./cpp-env.nix {inherit inputs system;};
  agora-dev = import ./agora-dev.nix {inherit inputs system;};
  rime = import ./common/rime.nix {inherit inputs system;};
  ash = import ./common/ash.nix {inherit inputs system;};
}
