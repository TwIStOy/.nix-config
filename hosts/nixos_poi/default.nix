_: let
  hostname = "poi";
in {
  networking.hostName = hostname;

  system.stateVersion = "23.11";
}
