{
  pkgs,
  username,
  ...
}: {
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;

    settings.auto-optimise-store = false;
    gc.automatic = false;
  };

  nixpkgs.config.allowUnfree = true;

  users.users."${username}" = {
    home = "/Users/${username}";
  };
}
