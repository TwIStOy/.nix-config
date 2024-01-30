{
  username,
  userfullname,
}: {
  users.mutableUsers = false;

  users.users."${username}" = {
    home = "/home/${username}";
    description = "${userfullname}";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}
