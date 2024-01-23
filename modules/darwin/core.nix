{pkgs, ...}: {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nixpkgs.config.allowUnfree = true;

  nix.settings.auto-optimise-store = false;
  nix.gc.automatic = false;
}
