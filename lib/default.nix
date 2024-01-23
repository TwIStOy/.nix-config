{ lib, ... }: {
  attrs = import ./attrs.nix { inherit lib; };
}
