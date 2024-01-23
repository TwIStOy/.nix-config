{ lib, ... }: {
  attrs = import ./attrs.nix { inherit lib; };
  macosSystem = import ./macosSystem.nix;
}
