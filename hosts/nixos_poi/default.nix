_: let
  hostname = "poi";
in {
  networking.hostName = hostname;
  networking.computerName = hostname;

  system.stateVersion = "23.11";
}
