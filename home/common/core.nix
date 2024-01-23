{username, ...}: {
  home = {
    inherit username;

    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
