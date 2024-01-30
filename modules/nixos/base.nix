{
  username,
  userfullname,
  ...
}: {
  users.users."${username}" = {
    home = "/home/${username}";
    description = "${userfullname}";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  security.sudo.extraRules = [
    {
      users = ["${username}"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
  programs.ssh = {
    startAgent = true;
  };
}
