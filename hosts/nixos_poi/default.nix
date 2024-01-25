_: let
  hostname = "poi";
in {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  system.stateVersion = "23.11";
}
