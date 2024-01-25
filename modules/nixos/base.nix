{username, ...}: {
  users.users."${username}" = {
    home = "/home/${username}";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  security.sudo.extraRules = [
    {
      users = ["${username}"];
      options = ["NOPASSWD"];
    }
  ];
}
